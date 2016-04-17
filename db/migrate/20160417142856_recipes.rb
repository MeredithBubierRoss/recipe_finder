class Recipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false
    end
  end
end
