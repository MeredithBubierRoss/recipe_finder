require 'rails_helper'

# As a user
# I want to be able to mark recipes as favorites
# So I can always have easy access to them.
#
# [X] Unauthenticated user does not see option to favorite recipe.
# [X] Authenticated user sees option to favorite recipe.
# [X] Authenticated user favorites recipe.
# [X] Authenticated user sees list of favorites on profile page.
# [X] Authenticated user removes recipe from list of favorites.

feature "User favorites recipes" do
  before(:each) do
    @recipe = FactoryGirl.create(:recipe)
    @user = FactoryGirl.create(:user)
  end

  scenario "Unauthenticated user does not see option to favorite recipe" do
    visit recipes_path

    click_link @recipe.name

    expect(page).to have_content @recipe.name
    expect(page).to_not have_content "Favorites"
  end

  before(:each) do
  end

  scenario "Authenticated user sees option to favorite recipe" do
    visit root_path

    click_link "sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    visit recipes_path

    click_link @recipe.name
    expect(page).to have_content "Add to Favorites"

    click_link "Add to Favorites"
    expect(page).to have_content "Remove from Favorites"
  end

  scenario "Authenticated user sees a list of favorited recipes" do
    @recipe1 = FactoryGirl.create(:recipe)
    @recipe2 = FactoryGirl.create(:recipe)
    @favorite1 = FactoryGirl.create(:favorite, user: @user, favorited: @recipe)
    @favorite2 = FactoryGirl.create(:favorite, user: @user, favorited: @recipe2)

    visit root_path

    click_link "sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    click_link @user.email
    expect(page).to have_content "Your favorite recipes"
    expect(page).to have_content @recipe.name
    expect(page).to have_content @recipe2.name
    expect(page).to_not have_content @recipe1.name
  end

  scenario "Authenticated user removes recipe from favorites" do
    @favorite = FactoryGirl.create(:favorite, user: @user, favorited: @recipe)
    visit root_path

    click_link "sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    visit recipes_path

    click_link @recipe.name
    expect(page).to have_content "Remove from Favorites"

    click_link "Remove from Favorites"
    expect(page).to have_content "Add to Favorites"
  end
end
