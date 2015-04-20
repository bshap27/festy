class FestivalsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    if sort_column == "count" && sort_direction == "desc"
      @festivals = Festival.all.sort{|f1,f2| f2.artists.count <=> f1.artists.count}
    elsif sort_column == "count" && sort_direction == "asc"
      @festivals = Festival.all.sort{|f1,f2| f1.artists.count <=> f2.artists.count}
    else
      @festivals = Festival.order(sort_column + " " + sort_direction)
    end
  end

  def show
    @festivals = Festival.order("name")
    @festival = Festival.find(params[:id])
    @artists = @festival.artists.order("sort_order")
    @playlist = SpotifyApi.new(@festival.name).find_playlist
    @state_festivals = Festival.where("state = '#{@festival.state}'").where("name != '#{@festival.name}'").order("name")
  end

  private

  def sort_column
    %w[name count start_date end_date state].include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end