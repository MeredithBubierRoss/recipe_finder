class IngredientsController < ApplicationController
  def index
    @results = Yummly.search(params[:search])
    @recipe_names = @results.collect { |recipe| recipe.name }
  end
end
