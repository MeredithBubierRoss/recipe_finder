class DropIngredientsTable < ActiveRecord::Migration
  def change
    drop_table :ingredients
    drop_table :ingredients_recipes
  end
end
