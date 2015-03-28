class SongkickApi

  {event_id}

  BASE_URL = "http://api.songkick.com/api/3.0/events/"
  BASE_URL2 = ".json?apikey="
  APIKEY = ""

  def url(id)
    "#{BASE_URL}#{id}#{BASE_URL2}#{APIKEY}"
  end

  def get_json(url)
    JSON.load(open(url))
  end

  # def new_festival_day(id:, name:, festival:)
  #   json = self.get_json(url(id))
  #   date = json["Date"]
  #   f = Festival.find_by(name: festival).id
  #   FestivalDay.create(name: name, jambaseid: id, date: date, festival_id: f)
  # end

  def update_artists
    Festival.all.each do |fest|
      json = self.get_json(url(fest.songkickid))["resultsPage"]["results"]["event"]["performance"]

      json.each do |artist|
        artist = Artist.find_or_create_by(songkickid: artist["id"], name: artist["displayName"])
        FestivalArtist.find_or_create_by(artist_id: artist.id, festival_id: fest.id)
      end
    end
  end

end