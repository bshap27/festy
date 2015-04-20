require 'open-uri'
require 'Nokogiri'

namespace :db do
  desc "Fill ticket links"
  task populate: :environment do
    get_links
  end
end

def get_links
  Festival.all.each do |festival|
    fest_page = Nokogiri::HTML(open("http://festivals.jambase.com/festival/#{festival.slug}"))
    begin
      festival.update(ticket_link: fest_page.css("p.h4.text-primary").first.parent['href'])
      puts "added link for #{festival.name}"
    rescue
      puts "no link for #{festival.name}"
    end
  end
end