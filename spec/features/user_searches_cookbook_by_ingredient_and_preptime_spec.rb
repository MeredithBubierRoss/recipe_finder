require 'rails_helper'

# As a user
# I want to search the cookbook by ingredient and prep time
# So that I can make a meal in a certain timeframe with a certain ingredient.
#
# [X] User goes to cookbook
# [X] User searches cookbook by ingredient and prep time
# [X] User goes to recipe from listed results

feature "user searches cookbook by ingredient and prep time" do
  scenario "user visits cookbook" do
    visit recipes_path

    expect(page).to have_content "The Cookbook"
  end

  scenario "user searches cookbook by ingredient and prep time" do
    @recipe = FactoryGirl.create(:recipe)
    @recipe2 = Recipe.create(name: "PB & J", ingredients: "Peanut butter, jelly, bread",
      instructions: "Make a sandwich", duration: "3 minutes")

    visit recipes_path

    fill_in("content", with: "cheese")
    fill_in("duration", with: "1 hour")
    click_button "Search"

    expect(page).to have_content @recipe.name
    expect(page).to_not have_content @recipe2.name
  end

  scenario "user goes to recipe from listed results" do
    @recipe = FactoryGirl.create(:recipe)

    visit recipes_path

    fill_in("content", with: "cheese")
    fill_in("duration", with: "1 hour")
    click_button "Search"

    expect(page).to have_content @recipe.name
    click_link @recipe.name

    expect(page).to have_content @recipe.instructions
  end
end
