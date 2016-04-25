class Recipe < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :instructions, presence: true
  validates :ingredients, presence: true
  validates :duration, presence: true

  def self.search(query)
    where("ingredients ilike ? OR name ilike ? OR duration ilike ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end
end
