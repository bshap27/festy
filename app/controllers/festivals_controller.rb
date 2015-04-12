class FestivalsController < ApplicationController
  
  def index
    @festivals = Festival.order("name ASC")
  end

  def show
    @festivals = Festival.order("name ASC")
    @festival = Festival.find(params[:id])
    @artists = @festival.artists.order("sort_order ASC")
  end
end