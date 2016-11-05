require 'rails_helper'

# As a user
# I want to search by ingredient and prep time
# So I know when I will be able to have a meal.
#
# [X] User gets to Yummly search page
# [X] User enters ingredient and prep time, sees list of recipes with both
# [X] User clicks recipe name and is taken to recipe show page

feature "user searches api recipes by ingredient and prep time" do
  scenario "user searches recipes by ingredient and prep time", :vcr do
    visit root_path
    click_link "internet"

    fill_in :query, with: "rice, 30 minutes"
    click_button "Search"
    expect(page).to have_content("Cheesy Brown Rice Risotto with Leeks and Asparagus")
  end

  scenario "user clicks recipe name and gets recipe information", :vcr do
    visit root_path
    click_link "internet"

    fill_in :query, with: "rice, 30 minutes"
    click_button "Search"

    click_link "Cheesy Brown Rice Risotto with Leeks and Asparagus"
    expect(page).to have_content "1 pound asparagus"
  end
end
