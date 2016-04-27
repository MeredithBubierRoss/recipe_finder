require 'rails_helper'

# As a user
# I want to delete a recipe I wrote
# Because I want to take it out of the cookbook
#
# [X] User selects recipe to delete
# [X] User deletes recipe

feature "user deletes a recipe they wrote" do
  scenario "user selects a recipe to delete" do
    @user = FactoryGirl.create(:user)
    @recipe1 = FactoryGirl.create(:recipe, user: @user)
    @recipe2 = FactoryGirl.create(:recipe, user: @user)
    @recipe3 = FactoryGirl.create(:recipe, user: @user)

    visit root_path

    click_link "sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"
    click_link @user.email

    expect(page).to have_content @recipe1.name
    expect(page).to have_content @recipe2.name
    expect(page).to have_content @recipe3.name

    click_link @recipe2.name

    expect(page).to have_content "Delete"
  end

  scenario "user deletes recipe" do
    @user = FactoryGirl.create(:user)
    @recipe1 = FactoryGirl.create(:recipe, user: @user)
    @recipe2 = FactoryGirl.create(:recipe, user: @user)
    @recipe3 = FactoryGirl.create(:recipe, user: @user)

    visit root_path

    click_link "sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"
    click_link @user.email

    expect(page).to have_content @recipe1.name
    expect(page).to have_content @recipe2.name
    expect(page).to have_content @recipe3.name

    click_link @recipe2.name

    click_link "Delete"
    expect(page).to have_content "Recipe deleted"
    expect(page).to have_content @recipe1.name
    expect(page).to have_content @recipe3.name
    expect(page).to_not have_content @recipe2.name
  end
end
