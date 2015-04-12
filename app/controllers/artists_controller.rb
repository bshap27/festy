class ArtistsController < ApplicationController
  
  def index
    @first_letters = Artist.first_letters
    
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
    @userartist = UserArtist.find_by(user_id: current_user, artist_id: @artist) || UserArtist.new
  end
end