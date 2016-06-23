class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable
  has_many :recipes
  has_many :favorites
  has_many :favorite_recipes, through: :favorites, source: :favorited, source_type: 'Recipe'
end
