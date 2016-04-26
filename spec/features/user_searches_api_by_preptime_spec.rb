require 'rails_helper'

# As a user
# I want to search by prep time
# So I know when I will be able to have a meal.
#
# [X] User gets to Yummly search page
# [X] User enters prep time, sees list of recipes with prep time
# [X] User clicks recipe name and is taken to recipe show page

feature "user searches api recipes by prep time" do
  scenario "user searches recipes by prep time", :vcr do
    visit root_path
    click_link "something new"

    fill_in :query, with: "30 minutes"
    click_button "Search"
    expect(page).to have_content "30-Minute Pork Fajitas"
  end

  scenario "user clicks recipe name and gets recipe information", :vcr do
    visit root_path
    click_link "something new"

    fill_in :query, with: "30 minutes"
    click_button "Search"

    click_link "30-Minute Pork Fajitas"
    expect(page).to have_content "1 pound pork, diced"
  end
end
