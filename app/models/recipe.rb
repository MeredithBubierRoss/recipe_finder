class Recipe < ActiveRecord::Base
  has_many :users

  validates :name, presence: true
  validates :instructions, presence: true
  validates :ingredients, presence: true
end
