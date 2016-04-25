class AddDurationToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :duration, :string
  end
end
