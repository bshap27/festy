class FestivalsController < ApplicationController
  
  def index
    @festivals = Festival.all
    # @artists = Artist.order("name")

    # artists
    @first_letters = Artist.all.collect {|artist| artist.name.capitalize[0,1]}.uniq.sort
    
    if params[:letter]
      @artists = Artist.by_letter(params[:letter])
    end

    respond_to do |f|
      f.js {}
      f.html {}
    end

  end

  def show
    @festivals = Festival.all
    @festival = Festival.find(params[:id])
    # binding.pry
  end
end