class RecipesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
