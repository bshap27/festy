class FestivalsController < ApplicationController
  
  def index
    @festivals = Festival.all
  end

  def show
    @festivals = Festival.all
    @festival = Festival.find(params[:id])
    # binding.pry
  end
end