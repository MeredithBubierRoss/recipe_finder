require 'rails_helper'

# As a user
# I want to sign into my account
# And add a new recipe to my personal cookbook
#
# [] User goes to personal cookbook, sees list of recipes
# [] User adds a new recipe to cookbook
# [] User can favorite a recipe they like
# [] User fills out form incorrectly, sees error messages

feature "authenticated user adds a new recipe" do
  scenario "authenticated user adds recipe" do
    @user = FactoryGirl.create(:user)
    @recipe = FactoryGirl.create(:recipe)

    login_as(@user)

    visit root_path

    click_link "cookbook"
    click_link "Add a new recipe"

    fill_in "Name", with: @recipe.name
    fill_in "Instructions", with: @recipe.instructions
    fill_in "Ingredients", with: @recipe.ingredients

    click_button "Add recipe"

    expect(page).to have_content @recipe.name
  end

  scenario "unauthenticated user tries to add recipe" do
    visit recipes_path

    expect(page).to have_content "Available Recipes"
  end

  scenario "user favorites a recipe" do
  end

  scenario "user fills out form incorrectly" do
  end
end
