class UserArtistsController < ApplicationController
  
  def create
    @userartist = UserArtist.find_or_create_by(user_artist_params)
    if @userartist.save
      redirect_to artist_path(Artist.find(params[:user_artist][:artist_id]))
    else
      raise params.inspect
    end
  end

  def destroy
    @user_artist = UserArtist.find(params[:id])
    @user_artist.destroy
    #UserFestival.find_by(user_id: current_user.id, festival_id: params[:id], relationship_type: 1)
  end

  private

  def user_artist_params
    params.require(:user_artist).permit(:user_id, :artist_id, :relationship_type)
  end

end