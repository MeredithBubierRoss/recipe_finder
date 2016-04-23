class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe saved!"
      redirect_to recipes_path
    else
      flash[:alert] = @recipe.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :instructions)
  end
end
