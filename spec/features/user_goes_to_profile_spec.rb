require 'rails_helper'

# As a user
# I want to see my profile page
# After I log in
#
# [X] User logs into account
# [X] User goes to profile page

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
end
