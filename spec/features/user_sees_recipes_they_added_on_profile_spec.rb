require 'rails_helper'

# As a user
# I want to go to my profile page
# And see the recipes I have added to the public cookbook
#
# [] User goes to profile page
# [] User sees list of recipes they have added
# [] User doesn't see recipes submitted by other users

feature "user sees the recipes they've added on their profile" do
  scenario "user goes to profile page" do
    @user = FactoryGirl.create(:user)
    @recipe1 = FactoryGirl.create(:recipe, user: @user)
    @recipe2 = FactoryGirl.create(:recipe, user: @user)
    @recipe3 = FactoryGirl.create(:recipe, user: @user)
    @recipe4 = FactoryGirl.create(:recipe, user: @user)

    visit root_path
    click_link "sign in"

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    click_link @user.email
    expect(page).to have_content "Your profile"
    expect(page).to have_content @user.recipes.name
  end

  scenario "user sees only the recipes they've added" do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @recipe1 = FactoryGirl.create(:recipe, user: @user1)
    @recipe2 = FactoryGirl.create(:recipe, user: @user1)
    @recipe3 = FactoryGirl.create(:recipe, user: @user2)
    @recipe4 = FactoryGirl.create(:recipe, user: @user2)

    visit root_path
    click_link "sign in"

    fill_in "Email", with: @user1.email
    fill_in "Password", with: @user1.password

    click_button "Log in"
    click_link @user1.email

    expect(page).to have_content "Your profile"
    expect(page).to have_content @user1.recipes.first.name
    expect(page).to have_content @user1.recipes.second.name
    expect(page).to_not have_content @user2.recipes.first.name
    expect(page).to_not have_content @user2.recipes.second.name
  end
end
