require 'rails_helper'

# As a user
# I want to be able to edit recipes
# So I can make changes when I feel they are necessary.
#
# [X] User can get to edit form
# [] User makes changes to recipe that are saved
# [] User chooses not to make changes and edit is cancelled

feature "user edits a recipe" do
  scenario "user goes to edit form" do
    @user = FactoryGirl.create(:user)
    @recipe1 = FactoryGirl.create(:recipe, user: @user)
    @recipe2 = FactoryGirl.create(:recipe, user: @user)

    visit root_path

    click_link "sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    click_link @user.email
    click_link @recipe1.name

    click_on "Edit"
    expect(page).to have_content "Adjust your recipe"
  end

  scenario "only authoring user can edit recipe" do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @recipe1 = FactoryGirl.create(:recipe, user: @user1)
    @recipe2 = FactoryGirl.create(:recipe, user: @user2)

    visit root_path

    click_link "sign in"
    fill_in "Email", with: @user1.email
    fill_in "Password", with: @user1.password

    click_button "Log in"
    click_link "cookbook"
    click_link @recipe2.name

    expect(page).to_not have_content "Edit"
  end

  scenario "user edits a recipe" do
    @user = FactoryGirl.create(:user)
    @recipe1 = FactoryGirl.create(:recipe, user: @user)
    @recipe2 = FactoryGirl.create(:recipe, user: @user)

    visit root_path

    click_link "sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    click_link @user.email
    click_link @recipe1.name

    click_on "Edit"
    fill_in "Name", with: "Ziti Casserole"
    click_button "Update recipe"

    expect(page).to have_content "Ziti Casserole"
    click_link "Ziti Casserole"
    expect(page).to have_content @recipe1.instructions
  end

  scenario "user changes mind mid edit" do
    @user = FactoryGirl.create(:user)
    @recipe1 = FactoryGirl.create(:recipe, user: @user)
    @recipe2 = FactoryGirl.create(:recipe, user: @user)

    visit root_path

    click_link "sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    click_link @user.email
    click_link @recipe1.name

    click_on "Edit"
    fill_in "Name", with: "Ziti Casserole"
    click_on "Cancel update"

    expect(page).to have_content @recipe1.name
    expect(page).to have_content @recipe1.instructions
  end
end
