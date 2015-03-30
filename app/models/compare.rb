class Compare
	
  def initialize(fest1, fest2)
    @fest1 = fest1
    @fest2 = fest2
  end

  def artists_in_common
    @fest1.artists.select do |a|
      @fest2.artists.include?(a)
    end
  end

  def unique_artists(fest)
    fest.artists.select {|artist| !artists_in_common.include?(artist)}
  end

end