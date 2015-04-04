class ArtistsController < ApplicationController
  
  def index
    @first_letters = Artist.all.collect {|artist| artist.name.capitalize[0,1]}.uniq.sort
    
    if params[:letter]
      @artists = Artist.by_letter(params[:letter])
    end

    respond_to do |f|
      f.js {}
      f.html {}
    end

    @tops = Artist.joins(:festival_artists).limit(10).order('count_name DESC').group('name').count('name')

  end

  def show
    @artist = Artist.find(params[:id])
  end
end