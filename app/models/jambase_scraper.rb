require 'nokogiri'
require 'open-uri'

class JambaseScraper

  def scrape_fest_names_and_images
  end

  def scrape_festival(name)
    fest_page = Nokogiri::HTML(open("http://festivals.jambase.com/festival/#{name}"))

    festival = {:artists => []}

    festival[:slug] = name
    festival[:name] = fest_page.css("h1.article-title").text.strip
    festival[:start_date] = fest_page.css("[itemprop='startDate']")[0]["content"]
    festival[:end_date] = fest_page.css("[itemprop='endDate']")[0]["content"]
    festival[:img_url] = fest_page.css("div.featured-media.featured-media-img img").attr("src").value

    links = {}
    fest_page.css("div.panel.panel-info.panel-links div.panel-body ul.list-unstyled li a").each do |li|
      links[li.text.strip[1..-1]] = li["href"].strip
    end

    festival[:official_site] = links["Official Site"]
    festival[:facebook] = links["Facebook"]
    festival[:twitter] = links["Twitter"]
    festival[:youtube] = links["YouTube"]
    festival[:instagram] = links["Instagram"]

    festival[:city] = fest_page.css("[itemprop='addressLocality']")[0].text
    festival[:state] = fest_page.css("[itemprop='addressRegion']")[0].text
    festival[:zipcode] = fest_page.css("[itemprop='postalCode']")[0].text

    fest_page.css("div.panel-body222.text-center ul li a").each_with_index do |a, index|
      name = a.text.strip
      if name[0,4] == "The "
        festival[:artists] << {name: name, sort_name: name[4..-1], sort_order: index}
      elsif name[0,1] == "."
        festival[:artists] << {name: name, sort_name: name[1..-1], sort_order: index}
      elsif name != ""
        festival[:artists] << {name: name, sort_name: name, sort_order: index}
      end
    end

    festival
  end

  def self.create_or_update_festival(slug)
    f = Festival.find_by(slug: slug)
    hash = self.new.scrape_festival(slug)
    if f
      f.update(official_site: hash[:official_site], facebook: hash[:facebook], twitter: hash[:twitter], youtube: hash[:youtube], instagram: hash[:instagram],  city: hash[:city], state: hash[:state], zipcode: hash[:zipcode])
    else
      if hash[:artists].size > 0
        f = Festival.create(slug: slug, name: hash[:name], start_date: hash[:start_date], end_date: hash[:end_date], img_url: hash[:img_url], official_site: hash[:official_site], facebook: hash[:facebook], twitter: hash[:twitter], youtube: hash[:youtube], instagram: hash[:instagram],  city: hash[:city], state: hash[:state], zipcode: hash[:zipcode])
      end
    end

    if f
      hash[:artists].each do |a|
        artist = Artist.find_or_create_by(name: a[:name])
        artist.sort_name = a[:sort_name]
        artist.save
        fa = FestivalArtist.find_or_create_by(artist_id: artist.id, festival_id: f.id)
        fa.update(sort_order: a[:sort_order])
      end
    end
  end

end