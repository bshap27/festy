class SearchController < ApplicationController

  # def create
  # end
 
  def show
    @search_term = "%#{params["search"]["search_term"].downcase}%"
    search_results
  end
 
private

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

end