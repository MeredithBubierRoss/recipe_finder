require 'rails_helper'

# As a user
# I want to be able to create an account
# So I can save the recipes I enjoy.
#
# [x] User goes to index, clicks link to sign up
# [x] User creates a new account
# [x] User fills out form incorrectly, sees prompt to refill/resubmit

feature "new user signs up for account" do
  scenario "user creates account" do

    visit root_path
    within('div.top-bar-left') do
      click_link "Sign up"
    end

    fill_in "Email", with: "abc@def.com"
    fill_in "Password", with: "Password"
    fill_in "Password confirmation", with: "Password"

    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "user fills out form incorrectly" do

    visit root_path
    within('nav.title-bar') do
      click_link "Sign up"
    end

    click_button "Sign up"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
  end

  scenario "user picks email already in use" do
    @user = FactoryGirl.create(:user)

    visit root_path
    within('div.top-bar-left') do
      click_link "Sign up"
    end

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password

    click_button "Sign up"

    expect(page).to have_content "Email has already been taken"
  end
end
