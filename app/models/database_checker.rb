class DatabaseChecker

  def no_lineup?
    # Festival.all.select {|fest| fest.artists.count < 15}
    # Festival.all.collect {|fest| [fest.name, fest.artists.count] if fest.artists.count == 0}.compact
    Festival.all.collect {|fest| fest.id if fest.artists.count == 0}.compact
  end

  def artist_no_name
    a = Artist.find_by(name: "")
    a.destroy_all
    #FestivalArtist.find_by(artist_id: a.id)
    FestivalArtist.where("artist_id = #{a.id}")
  end

  def sort_name_nil
    Artist.where(sort_name: nil).each do |artist|
      artist.sort_name = artist.name
      artist.save
    end
  end

end

# [["Electric Daisy Carnival Las Vegas", 0],
#  ["Sterling Stage 20 Year Anniversary Party", 0],
#  ["Willy Fest Music & Art Gathering 2015", 0],
#  ["80/35", 0],
#  ["Red Wing Roots Music Festival", 0],
#  ["Vancouver Island Musicfest", 0],
#  ["Finger Lakes GrassRoots Festival of Music and Dance", 0],
#  ["Northern Nights Music Festival", 0],
#  ["Great South Bay Music Festival", 0],
#  ["Spectral Spirit Fest", 0]]

# def count_fests(a)
#   ans = []
#   a.each do |fest|
#     fest.artists.each do |artist|
#       ans << "#{fest.name}: #{artist.name}: #{artist.festivals.count}"
#     end
#   end
#   ans
# end