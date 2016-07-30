require 'rails_helper'

# As a user
# I want to see a list of all recipes
# So I can browse for something that sounds delicious.
#
# [X] Unauthenticated user visits index, sees list of all recipes
# [X] User clicks recipe name and is taken to recipe show page
# [X] Submitting user's information is visible in recipe

feature "user goes to list of available recipes" do
  scenario "user sees list of recipes on index" do
    food1 = FactoryGirl.create(:recipe)
    food2 = FactoryGirl.create(:recipe)
    food3 = FactoryGirl.create(:recipe)

    visit recipes_path

    expect(page).to have_content "The Cookbook"
    expect(page).to have_content food1.name
    expect(page).to have_content food2.name
    expect(page).to have_content food3.name
  end

  scenario "user clicks recipe name and gets recipe details" do
    user = FactoryGirl.create(:user)
    recipe = Recipe.create(name: "Pasta and Sauce", ingredients: "Pasta and sauce",
      instructions: "Boil water, cook pasta, and drain. Pour
      sauce from jar. Enjoy!", duration: "20 minutes", user: user)

    visit recipes_path

    expect(page).to have_link "Pasta and Sauce"

    click_link "Pasta and Sauce"

    expect(page).to have_content recipe.instructions
    expect(page).to have_content "Submitted by:"
    expect(page).to have_content recipe.user.email
  end

  scenario "user returns to root from list" do
    visit recipes_path
    within("nav.title-bar") do
      click_link "Home"
    end

    expect(page.current_path).to eq root_path
  end

  scenario "user returns to recipe list" do
    @recipe = FactoryGirl.create(:recipe)

    visit recipes_path
    click_link @recipe.name

    within("div.top-bar-right") do
      click_link "Recipe List"
    end

    expect(page.current_path).to eq recipes_path
  end

  scenario "user returns to root from recipe" do
    @recipe = FactoryGirl.create(:recipe)

    visit recipes_path
    click_link @recipe.name

    within("nav.title-bar") do
      click_link "Home"
    end

    expect(page.current_path).to eq root_path
  end
end
