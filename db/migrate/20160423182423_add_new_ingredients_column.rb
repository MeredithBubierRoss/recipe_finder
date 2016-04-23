class AddNewIngredientsColumn < ActiveRecord::Migration
  def change
    add_column :recipes, :ingredients, :text, null: false
  end
end
