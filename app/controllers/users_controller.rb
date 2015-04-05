class UsersController < ApplicationController

  def show
  end

  def artists
    @artists = current_user.artists
    @festivals_going = Festival.joins(:users).where("user_id = #{current_user.id}").where("relationship_type = 0")
    @festivals_watching = Festival.joins(:users).where("user_id = #{current_user.id}").where("relationship_type = 1")
  end

  def festivals
    @artists = current_user.artists
    @festivals_going = Festival.joins(:users).where("user_id = #{current_user.id}").where("relationship_type = 0")
    @festivals_watching = Festival.joins(:users).where("user_id = #{current_user.id}").where("relationship_type = 1")
  end

end