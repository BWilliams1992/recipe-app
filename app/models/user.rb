class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :comments
  has_one_attached :avatar

  after_create :create_my_recipes_collection

  private 

    def create_my_recipes_collection 
      self.collections.create({title:"My Recipes", description:"This collection contains the recipes you create. It is automatically managed by the applicaiton"})
    end
end
