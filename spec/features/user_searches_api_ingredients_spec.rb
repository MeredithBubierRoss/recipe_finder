require 'rails_helper'

# As a user
# I want to search by ingredient
# So I can find a new recipe that has a component I want to eat in it.

# [X] User gets to Yummly search page
# [X] User enters ingredient, sees list of recipes with ingredient
# [X] User clicks recipe name and is taken to recipe show page

feature "user searches api recipes by ingredient" do
  scenario "user searches recipes by ingredient", :vcr do
    visit root_path
    click_link "something new"

    fill_in :query, with: "shrimp"
    click_button "Search"
    expect(page).to have_content("Shrimp")
  end

  scenario "user clicks recipe name and gets recipe information", :vcr do
    visit root_path
    click_link "something new"

    fill_in :query, with: "shrimp"
    click_button "Search"

    click_link "Shrimp Ceviche"
    expect(page).to have_content "Juice of 2 limes"
  end
end
