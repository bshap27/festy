class CompareController < ApplicationController

  def compare
    @fest1 = Festival.find(params["fest1"])
    @fest2 = Festival.find(params["fest2"])
    @compare = Compare.new(@fest1, @fest2)
  end

end