require 'rails_helper'

# As a user
# I want to search the cookbook by ingredient
# So I can find a recipe that has a component I want to eat in it.
#
# [X] User goes to cookbook from root
# [X] User enters ingredient, sees list of recipes with ingredient
# [X] User clicks recipe name and is taken to recipe show page

feature "user searches cookbook for recipes by ingredient" do
  scenario "user gets to cookbook from homepage" do
    visit root_path

    click_link "cookbook"
    expect(page.current_path).to eq recipes_path
  end

  scenario "user searches recipes by ingredient" do
    @recipe1 = FactoryGirl.create(:recipe)
    @recipe2 = Recipe.create(name: "Mac and cheese", ingredients: "elbows, cheese",
      instructions: "put together, eat", duration: "20 minutes")
    @recipe3 = Recipe.create(name: "Grilled Cheese", ingredients: "Cheese, bread",
      instructions: "Cook on stove until cheese is melted. Enjoy", duration:
      "10 minutes")
    @recipe4 = Recipe.create(name: "Tuna Salad", ingredients: "Tuna, celery seed,
      mayonnaise", duration: "5 minutes")

    visit recipes_path
    fill_in("search", with: "cheese")
    click_button "Search"

    expect(page).to have_content @recipe1.name
    expect(page).to have_content @recipe2.name
    expect(page).to have_content @recipe3.name
    expect(page).to_not have_content @recipe4.name
  end

  scenario "user selects recipe, gets recipe details" do
    @recipe = FactoryGirl.create(:recipe)

    visit recipes_path
    fill_in "search", with: "cheese"
    click_button "Search"

    expect(page).to have_content @recipe.name

    click_link @recipe.name
    expect(page).to have_content @recipe.name
    expect(page).to have_content "cheese"
    expect(page).to have_content @recipe.instructions
  end
end
