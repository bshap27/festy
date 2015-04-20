class SpotifyApi

  def initialize(fest_name)
    @fest_name = fest_name
  end

  def self.authenticate
    RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
  end

  def find_playlist
    SpotifyApi.authenticate
    if @fest_name == "Coachella (Weekend 1)"
      RSpotify::Playlist.find('1268738460','4AtJbgbmD0GgrpCSGkoE8R')
    else
      RSpotify::Playlist.search(@fest_name).first || ""
    end
  end

end