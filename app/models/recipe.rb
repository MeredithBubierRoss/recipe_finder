class Recipe < ActiveRecord::Base
  has_many :users

  validates :name, presence: true
  validates :instructions, presence: true
  validates :ingredients, presence: true

  def self.search(query)
    where("ingredients like ?", "%#{query}%") 
  end
end
