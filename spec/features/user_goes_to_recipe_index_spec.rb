require 'rails_helper'

# As a user
# I want to see a list of all recipes
# So I can browse for something that sounds delicious.
#
# [X] Unauthenticated user visits index, sees list of all recipes
# [] Authenticated user also sees link to favorites
# [X] User clicks recipe name and is taken to recipe show page

feature "user goes to list of available recipes" do
  scenario "user sees list of recipes on index" do
    chicken_ziti = Recipe.create(name: "Chicken Broccoli Ziti")
    pepper_risotto = Recipe.create(name: "Roasted Pepper Risotto")
    sticky_lemon = Recipe.create(name: "Sticky Lemon Chicken")

    visit root_path

    expect(page).to have_content "Recipes"
    expect(page).to have_content chicken_ziti.name
    expect(page).to have_content pepper_risotto.name
    expect(page).to have_content sticky_lemon.name

  end

  scenario "user clicks recipe name and gets recipe details" do
    pasta_sauce = Recipe.create(name: "Pasta and Sauce", instructions: "Boil
    water, cook pasta, and drain. Pour sauce from jar. Enjoy!")

    visit root_path

    expect(page).to have_link "Pasta and Sauce"

    click_on "Pasta and Sauce"

    expect(page).to have_content pasta_sauce.instructions
  end
end
