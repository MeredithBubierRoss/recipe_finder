class IngredientsController < ApplicationController
  def index
    @results = Yummly.search(params[:query])
    binding.pry
  end

  def show
    @recipe = Yummly.find(params[:id])
    binding.pry
  end
end
