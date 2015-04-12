# require 'json'
# require 'open-uri'

# class JambaseApi

#   BASE_URL = "http://api.jambase.com/events?id="
#   BASE_URL2 = "&api_key=4ysfqpbxfr9ery93v2c32bvm&o=json"

#   def url(id)
#     "#{BASE_URL}#{id}#{BASE_URL2}"
#   end

#   def get_json(url)
#     JSON.load(open(url))
#   end

#   def new_festival_day(id:, name:, festival:)
#     json = self.get_json(url(id))
#     date = json["Date"]
#     f = Festival.find_by(name: festival).id
#     FestivalDay.create(name: name, jambaseid: id, date: date, festival_id: f)
#   end

#   def update_artists
#     FestivalDay.all.each do |festday|
#       json = self.get_json(url(festday.jambaseid))

#       json["Artists"].each do |artist|
#         artist = Artist.find_or_create_by(jambaseid: artist["Id"], name: artist["Name"])
#         FestivalArtist.find_or_create_by(artist_id: artist.id, festival_day_id: festday.id)
#       end
#     end
#   end

# end