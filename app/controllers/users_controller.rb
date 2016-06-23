class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @favorites = @user.favorite_recipes
  end
end
