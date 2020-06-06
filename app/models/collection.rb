class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_recipes
  has_many :recipes, through: :collection_recipes
end