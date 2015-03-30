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

    fest_page.css("div.panel-body222.text-center ul li a").each do |a|
      name = a.text.strip
      if name[0,4] == "The "
        festival[:artists] << {name: name, sort_name: name[4..-1]}
      else
        festival[:artists] << {name: name, sort_name: name}
      end
    end

    festival
  end

  # def self.create_artists(name)
  #   f = Festival.find_or_create_by(name: name)
  #   self.new.scrape_lineup(name.downcase.gsub(" ", "-")).each do |a|
  #     a_id = Artist.find_or_create_by(name: a).id
  #     FestivalArtist.find_or_create_by(artist_id: a_id, festival_id: f.id)
  #   end
  # end

  def self.create_or_update_festival(slug)
    # binding.pry
    f = Festival.find_by(slug: slug)
    hash = self.new.scrape_festival(slug)
    f = Festival.create(slug: slug, name: hash[:name], start_date: hash[:start_date], end_date: hash[:end_date], img_url: hash[:img_url]) if !f

    hash[:artists].each do |a|
      artist = Artist.find_or_create_by(name: a[:name])
      artist.sort_name ||= a[:sort_name]
      FestivalArtist.find_or_create_by(artist_id: artist.id, festival_id: f.id)
    end
  end

end