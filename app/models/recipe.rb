class Recipe < ApplicationRecord 
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients,
  reject_if: lambda { |attributes| attributes['name'].blank? || attributes['amount'].blank? }, allow_destroy: true
  validates :title, presence: true
  validates :method, presence: true
end