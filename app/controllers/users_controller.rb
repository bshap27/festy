class UsersController < ApplicationController

  def show
    @artists = current_user.artists
    @festivals_going = Festival.joins(:users).where("user_id = #{current_user.id}").where("relationship_type = 0")
    @festivals_watching = Festival.joins(:users).where("user_id = #{current_user.id}").where("relationship_type = 1")
  end
end