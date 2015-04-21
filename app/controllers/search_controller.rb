class SearchController < ApplicationController
  before_action :authenticate_user!
  before_action :search_term, only: [:show_posts, :user_results]

  def show
    search_results
  end

  def user_results
    search_users
  end
 
private

  def search_term
    @search_term = "%#{params["search"]["search_term"].downcase}%"
  end

  def search_results
    category = params["category"]
    if category == "Artist" || category == "None"
      artists = Artist.arel_table
      # @artist_results = Artist.where("name like '%#{@search_term}%'")
      @artist_results = Artist.where(artists[:name].matches(@search_term))
    end
    if category == "Festival" || category == "None"
      festivals = Festival.arel_table
      # @festival_results = Festival.where("name like '%#{@search_term}%'")
      @festival_results = Festival.where(festivals[:name].matches(@search_term))
    end
  end

  def search_users
    @user_results = User.where("email like '%#{@search_term}%'")
  end

end