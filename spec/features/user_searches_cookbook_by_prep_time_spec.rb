require 'rails_helper'

# As a user
# I want to search the public cookbook by prep time
# So I can plan a meal in a certain timeframe
#
# [X] User goes to cookbook from root
# [X] User enters prep time, sees list of recipes with prep time
# [X] User clicks recipe name and is taken to recipe show page

feature "user searches cookbook for recipes by prep time" do
  scenario "user gets to cookbook from homepage" do
    visit root_path

    click_link "cookbook"
    expect(page.current_path).to eq recipes_path
  end

  scenario "user searches recipes by prep time" do
    @recipe1 = FactoryGirl.create(:recipe)
    @recipe2 = Recipe.create(name: "Mac and cheese", ingredients: "elbows, cheese",
      instructions: "put together, eat", duration: "30 minutes")
    @recipe3 = Recipe.create(name: "Grilled Cheese", ingredients: "Cheese, bread",
      instructions: "Cook on stove until cheese is melted. Enjoy", duration: "10 minutes")

    visit recipes_path
    fill_in("duration", with: "30 minutes")
    click_button "Search"
    expect(page).to have_content @recipe2.name
    expect(page).to_not have_content @recipe3.name
    expect(page).to_not have_content @recipe1.name
  end

  scenario "user selects recipe, gets recipe details" do
    @recipe = FactoryGirl.create(:recipe)

    visit recipes_path
    fill_in("duration", with: @recipe.duration)
    click_button "Search"

    expect(page).to have_content @recipe.name

    click_link @recipe.name
    expect(page).to have_content @recipe.name
    expect(page).to have_content @recipe.duration
    expect(page).to have_content @recipe.instructions
  end
end
