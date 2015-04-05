class UserFestivalsController < ApplicationController
  
  def create
    @userfestival = UserFestival.find_or_create_by(user_festival_params)
    if @userfestival.save
      redirect_to festival_path(Festival.find(params[:user_festival][:festival_id]))
    else
      raise params.inspect
    end
  end

  def destroy
    @user_festival = UserFestival.find(params[:id])
    @user_festival.destroy
    #UserFestival.find_by(user_id: current_user.id, festival_id: params[:id], relationship_type: 1)
    redirect_to :back
  end

  private

  def user_festival_params
    params.require(:user_festival).permit(:user_id, :festival_id, :relationship_type)
  end

end