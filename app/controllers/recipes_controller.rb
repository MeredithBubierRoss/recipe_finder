class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    if params[:content] && params[:duration].blank?
      @recipes = Recipe.search(params[:content]) unless params[:content].blank?
    elsif params[:duration] && params[:content].blank?
      @recipes = Recipe.search(params[:duration]) unless params[:duration].blank?
    elsif params[:content] && params[:duration]
      @first_recipes = Recipe.search(params[:content])
      @recipes = @first_recipes.search(params[:duration])
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @user = current_user
    @recipe.user = @user
    if @recipe.save
      flash[:notice] = "Recipe saved!"
      redirect_to recipes_path
    else
      flash[:alert] = @recipe.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      flash[:notice] = "Recipe updated!"
      redirect_to recipes_path
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :instructions, :duration)
  end
end
