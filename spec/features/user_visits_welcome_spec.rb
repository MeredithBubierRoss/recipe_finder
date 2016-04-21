require 'rails_helper'

# As a user
# I want to go to a welcome page
# And get the option to look at my personal recipes
# Or find something new
#
# [] User visits welcome page
# [] User chooses to see personal recipes
# [] User chooses to find a new recipe

feature "user visits welcome page" do
  scenario "user visits welcome page" do
    visit root_path

    expect(page).to have_content "It's Suppertime!"
  end

  scenario "user chooses personal recipes" do
    visit root_path

    click_link "personal"

    expect(page.current_path).to eq recipes_path
    expect(page).to have_content "Your Recipes"
  end

  scenario "user chooses to search for new recipe" do
    VCR.use_cassette('user goes to recipe search from welcome page') do
      visit root_path

      click_link "something new"

      expect(page.current_path).to eq ingredients_path
      expect(page).to have_content "Recipe Search"
    end
  end
end
