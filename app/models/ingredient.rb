class Ingredient < ApplicationRecord
  validates :name, presence: true
  
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients
end