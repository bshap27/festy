class CompareController < ApplicationController

  def index
    @festivals = Festival.all.order("name")
    # @artists = Artist.order("name")

    # artists
    @first_letters = Artist.first_letters
    
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