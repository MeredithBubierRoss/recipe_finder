class IngredientsController < ApplicationController
  def index
    @results = Yummly.search(params[:query])
  end

  def show
    @recipe = Yummly.find(params[:id])
  end
end
