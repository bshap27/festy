# require 'json'
# require 'open-uri'

class SpotifyApi

#   BASE_URL = "https://api.spotify.com/v1/users/festivalsnob/playlists"

#   def get_json(url)
#     JSON.load(open(url))
#   end

#   def get_first_track_info(music_hash)
#     first_track = music_hash["tracks"][0]
#     "#{first_track["track_name"]} by #{first_track["artist_name"]} from the album #{first_track["album_name"]}"
#   end

#   def most_streamed(region)
#     regional_url = get_url(region)
#     json_hash = get_json(regional_url)
#     get_first_track_info(json_hash)
#   end

# end
# require 'rspotify'
  def initialize(fest_name)
    @fest_name = fest_name
  end

  def self.authenticate
    RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
  end

    # RSpotify::User.find('festivalsnob')
    # p = festivalsnob.playlists #=> (Playlist array)
  def find_playlist
    SpotifyApi.authenticate
    RSpotify::Playlist.search(@fest_name).first
  end

end