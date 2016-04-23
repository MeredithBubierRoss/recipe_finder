class RecipeIngredientsToArray < ActiveRecord::Migration
  def change
    change_column :recipes, :ingredients, :text, array: true, default: [], using: "(string_to_array(ingredients, ','))"
  end
end
