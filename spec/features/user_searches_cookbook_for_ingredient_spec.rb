# As a user
# I want to search the cookbook by ingredient
# So I can find a recipe that has a component I want to eat in it.
#
# [] User goes to cookbook from root
# [] User enters ingredient, sees list of recipes with ingredient
# [] User clicks recipe name and is taken to recipe show page

feature "user searches cookbook for recipes by ingredient" do
  scenario "user gets to cookbook from homepage" do
    visit root_path

    click_link "cookbook"
    expect(page.current_path).to eq recipes_path
  end

  scenario "user searches recipes by ingredient" do
    @recipe = FactoryGirl.create(:recipe)

    visit recipes_path
    fill_in("search", with: "cheese")
    click_button "Search"

    expect(page).to have_content @recipe.name
  end

  scenario "user selects recipe, gets recipe details" do
    @recipe = FactoryGirl.create(:recipe)

    visit recipes_path
    fill_in "search", with: "cheese"
    click_button "Search"

    expect(page).to have_content @recipe.name

    click_link @recipe.name
    expect(page).to have_content @recipe.name
    expect(page).to have_content @recipe.ingredients
    expect(page).to have_content @recipe.instructions
  end
end
