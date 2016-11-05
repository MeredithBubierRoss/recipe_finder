require 'rails_helper'

# As a user
# I want to go to a welcome page
# And get the option to look at my personal recipes
# Or find something new
#
# [X] User visits welcome page
# [X] User chooses to see personal recipes
# [X] User chooses to find a new recipe

feature "user visits welcome page" do
  scenario "user visits welcome page" do
    visit root_path

    expect(page).to have_content "It's Suppertime!"
  end

  scenario "unauthenticated user chooses cookbook" do
    visit root_path

    click_link "users"

    expect(page.current_path).to eq recipes_path
    expect(page).to have_content "The Cookbook"
  end

  scenario "authenticated user chooses cookbook" do
    @user = FactoryGirl.create(:user)
    login_as(@user)

    visit root_path

    click_link "users"

    expect(page.current_path).to eq recipes_path
    expect(page).to have_content "The Cookbook"
  end

  scenario "user chooses to search for new recipe" do
    VCR.use_cassette('user goes to recipe search from welcome page') do
      visit root_path

      click_link "internet"

      expect(page.current_path).to eq ingredients_path
      expect(page).to have_content "Recipe Search"
    end
  end
end
