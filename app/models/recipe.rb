class Recipe < ApplicationRecord 
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :recipe_ingredients
  
  has_many :collection_recipes
  has_many :collections, through: :collection_recipes

  has_one_attached :main_image
  
  validates :title, presence: true
  validates :method, presence: true

  def self.search(params)
    if params
      @parameter = params.downcase
      all.where("Lower(title) LIKE :search", search: "%#{@parameter}%")
    else
      all.where(private: false)
    end
    
    
  end

end