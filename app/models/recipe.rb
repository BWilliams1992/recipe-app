class Recipe < ApplicationRecord 
  belongs_to :user

  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients,
  reject_if: lambda { |attributes| attributes['name'].blank? || attributes['amount'].blank? }, allow_destroy: true
  
  has_many :collection_recipes
  has_many :collections, through: :collection_recipes
  
  validates :title, presence: true
  validates :method, presence: true
end