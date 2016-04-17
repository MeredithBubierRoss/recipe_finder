require 'rails_helper'

# As a user
# I want to sign into my account
# So I can save recipes to make again.
#
# [X] Authenticated user goes to index, clicks link to sign in
# [X] User signs into account and is taken to index
# [X] Unauthenticated user is prompted to sign up
# [X] User fills out form incorrectly, sees prompt to refill/resubmit

feature "authenticated user can sign in" do
  scenario "user with account signs in" do
    @user = FactoryGirl.create(:user)

    visit root_path
    click_link "sign in"

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    expect(page).to have_content "Signed in as #{@user.email}"
  end

  scenario "user without account tries to sign in" do

    visit root_path
    click_link "sign in"

    fill_in "Email", with: "xyz@abc.com"
    fill_in "Password", with: "password"

    click_button "Log in"

    expect(page).to have_content "Invalid email or password"
  end

  scenario "user fills out form incorrectly" do

    visit root_path
    click_link "sign in"

    click_button "Log in"

    expect(page).to have_content "Invalid email or password"
  end
end
