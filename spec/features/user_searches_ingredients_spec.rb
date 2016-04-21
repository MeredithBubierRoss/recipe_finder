require 'rails_helper'

# As a user
# I want to search by ingredient
# So I can find a recipe that has a component I want to eat in it.
#
# [X] User enters ingredient, sees list of recipes with ingredient
# [X] User clicks recipe name and is taken to recipe show page

feature "user searches api recipes by ingredient" do
  scenario "user searches recipes by ingredient", :vcr do
    visit ingredients_path

    fill_in :query, with: "shrimp"
    click_button "Search"
    expect(page).to have_content("Shrimp")
  end
end
