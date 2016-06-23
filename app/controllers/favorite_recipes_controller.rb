class FavoriteRecipesController < ApplicationController
  before_action :set_recipe

  def create
    if Favorite.create(favorited: @recipe, user: current_user)
      redirect_to @recipe, notice: "Recipe added to favorites."
    else
      redirect_to @recipe, alert: "Something went wrong, recipe not added."
    end
  end

  def destroy
    Favorite.where(favorited_id: @recipe.id, user_id: current_user.id).first.destroy
    redirect_to @recipe, notice: "Recipe removed from favorites."
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id] || params[:id])
  end
end
