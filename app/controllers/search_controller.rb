class SearchController < ApplicationController

  # def create
  # end
 
  def show
    @search_term = params["search"]["search_term"].downcase
    search_results
  end
 
private

  def search_results
    category = params["category"]
    if category == "Artist" || category == "None"
      @artist_results = Artist.where("name like '%#{@search_term}%'")
    end
    if category == "Festival" || category == "None"
      @festival_results = Festival.where("name like '%#{@search_term}%'")
    end
  end

end