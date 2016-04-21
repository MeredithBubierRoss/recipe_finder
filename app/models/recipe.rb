class Recipe < ActiveRecord::Base
  has_many :users
  has_many :ingredients

  validates :name, presence: true
end
