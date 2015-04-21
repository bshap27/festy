class UsersController < ApplicationController
  # before_action :festivals_going, :festivals_watching, :only => [:artists, :festivals, :show]

  def artists
  end

  def festivals
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def users_artists(user)
  end

end