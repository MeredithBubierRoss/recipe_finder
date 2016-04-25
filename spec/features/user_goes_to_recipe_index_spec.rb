require 'rails_helper'

# As a user
# I want to see a list of all recipes
# So I can browse for something that sounds delicious.
#
# [X] Unauthenticated user visits index, sees list of all recipes
# [X] Authenticated user also sees link to favorites
# [X] User clicks recipe name and is taken to recipe show page

feature "user goes to list of available recipes" do
  scenario "user sees list of recipes on index" do
    food1 = FactoryGirl.create(:recipe)
    food2 = FactoryGirl.create(:recipe)
    food3 = FactoryGirl.create(:recipe)

    visit recipes_path
    binding.pry

    expect(page).to have_content "Recipes"
    expect(page).to have_content food1.name
    expect(page).to have_content food2.name
    expect(page).to have_content food3.name
  end

  scenario "user clicks recipe name and gets recipe details" do
    pasta_sauce = Recipe.create(name: "Pasta and Sauce", ingredients: "Pasta and sauce",
      instructions: "Boil water, cook pasta, and drain. Pour
      sauce from jar. Enjoy!", duration: "20 minutes")

    visit recipes_path

    expect(page).to have_link "Pasta and Sauce"

    click_on "Pasta and Sauce"

    expect(page).to have_content pasta_sauce.instructions
  end

  scenario "authenticated user sees shortcut to favorited recipes" do
    @user = FactoryGirl.create(:user)

    login_as(@user)

    visit recipes_path

    expect(page).to have_link "Favorites"
  end

  scenario "user returns to root from list" do
    visit recipes_path

    click_link "Home"

    expect(page.current_path).to eq root_path
  end

  scenario "user returns to recipe list" do
    @recipe = FactoryGirl.create(:recipe)

    visit recipes_path
    click_link @recipe.name

    click_link "Return"
    expect(page.current_path).to eq recipes_path
  end

  scenario "user returns to root from recipe" do
    @recipe = FactoryGirl.create(:recipe)

    visit recipes_path
    click_link @recipe.name

    click_link "Home"

    expect(page.current_path).to eq root_path
  end
end
