class CompareController < ApplicationController

  def index
    @festivals = Festival.all
    # @artists = Artist.order("name")

    # artists
    @first_letters = Artist.all.collect {|artist| artist.name.capitalize[0,1]}.uniq.sort
    
    if params[:letter]
      @artists = Artist.by_letter(params[:letter])
    end

    respond_to do |f|
      f.js {}
      f.html {}
    end

  end

  def compare
    @fest1 = Festival.find(params["fest1"])
    @fest2 = Festival.find(params["fest2"])
    @compare = Compare.new(@fest1, @fest2)
  end

end