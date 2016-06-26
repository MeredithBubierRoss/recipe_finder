require 'rails_helper'

# As a user
# I want to see my profile page
# After I log in
#
# [X] User logs into account
# [X] User goes to profile page
# [X] Unauthenticated user cannot access profiles
# [] Authenticated user can only access personal profile

feature "user goes to profile" do
  scenario "user signs in, goes to profile" do
    @user = FactoryGirl.create(:user)

    visit root_path
    click_link "sign in"

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    click_link @user.email
    expect(page).to have_content "Your profile"
  end

  scenario "unauthenticated user cannot access profiles" do
    @user = FactoryGirl.create(:user)

    visit("/users/#{@user.id}")

    expect(page).to have_content "sign in or sign up before continuing"
  end

  scenario "authenticated user can only access personal profile" do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)

    visit root_path
    click_link "sign in"

    fill_in "Email", with: @user1.email
    fill_in "Password", with: @user1.password

    click_button "Log in"

    visit("users/#{@user2.id}")
    expect(page).to have_content "you don't have access to this page"
  end
end
