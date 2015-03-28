require 'nokogiri'
require 'open-uri'

class JambaseScraper

  def scrape_fest_names_and_images
  end

  def scrape_lineup(name)
    fest_page = Nokogiri::HTML(open("http://festivals.jambase.com/festival/#{name}"))

    artists = []

    fest_page.css("div.panel-body222.text-center ul li a").each do |a|
      artists << a.text.strip
    end
    artists
  end

  def self.create_artists(name)
    f = Festival.find_or_create_by(name: name)
    self.new.scrape_lineup(name.slug).each {|a| Artist.find_or_create_by(name: a)}
  end

  def slug(name)
    name.downcase.gsub(" ", "-")
  end


end