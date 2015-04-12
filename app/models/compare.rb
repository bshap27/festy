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
    a = artists_in_common
    fest.artists.order("sort_order").select {|artist| !a.include?(artist)}
  end

end