# require 'rails_helper'
#
# # As a user
# # I want to favorite certain recipes
# # So I can come back to them whenever I want
# #
# # [] Unauthenticated user goes to cookbook, does not see favorites option
# # [] Authenticated user goes to cookbook, sees favorites option
# # [] Authenticated user favorites a recipe from the cookbook
# # [] Authenticated user can remove favoriting from recipe
# # [] User goes to profile, sees favorite recipes from cookbook
#
# feature "user can favorite a recipe" do
#   scenario "unauthenticated user does not see favorites option" do
#     @recipe = FactoryGirl.create(:recipe)
#
#     visit root_path
#
#     click_link "cookbook"
#     click_link @recipe.name
#     expect(page).to_not have_content "Favorite"
#   end
#
#   scenario "authenticated user sees favorites option" do
#     @user1 = FactoryGirl.create(:user)
#     @user2 = FactoryGirl.create(:user)
#     @recipe = FactoryGirl.create(:recipe, user: @user2)
#
#     visit root_path
#     click_link "sign in"
#
#     fill_in "Email", with: @user1.email
#     fill_in "Password", with: @user1.password
#
#     click_button "Log in"
#     click_link "cookbook"
#     click_link @recipe.name
#     expect(page).to have_content "Favorite"
#   end
#
#   scenario "authenticated user favorites a recipe from the cookbook" do
#     @user1 = FactoryGirl.create(:user)
#     @user2 = FactoryGirl.create(:user)
#     @recipe = FactoryGirl.create(:recipe, user: @user2)
#
#     visit root_path
#     click_link "sign in"
#
#     fill_in "Email", with: @user1.email
#     fill_in "Password", with: @user1.password
#
#     click_button "Log in"
#     click_link "cookbook"
#     click_link @recipe.name
#
#     click_on "Favorite"
#
#     expect(page).to have_content "Unfavorite"
#     expect(page).to_not have_content "Favorite"
#   end
#
#   scenario "authenticated user removes favoriting from recipe" do
#     @user1 = FactoryGirl.create(:user)
#     @user2 = FactoryGirl.create(:user)
#     @recipe = FactoryGirl.create(:recipe, user: @user2)
#
#     visit root_path
#     click_link "sign in"
#
#     fill_in "Email", with: @user1.email
#     fill_in "Password", with: @user1.password
#
#     click_button "Log in"
#     click_link "cookbook"
#     click_link @recipe.name
#
#     click_on "Unfavorite"
#
#     expect(page).to have_content "Favorite"
#     expect(page).to_not have_content "Unfavorite"
#   end
#
#   scenario "user can see list of favorited recipes from profile" do
#     # @user = FactoryGirl.create(:user)
#
#   end
# end
