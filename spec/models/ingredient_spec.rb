require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "Creating a new ingredient" do
    context "successfully" do
      it "is successful" do
        ingredient = create(:cabbage)
        expect(Ingredient.count).to eq(1)
      end
    end
    context "unsuccessfully" do 
      it "is unsuccessful" do
        ingredient = build(:ingredient)
        ingredient.name = nil 
        expect(ingredient.save).to be false
        expect(Ingredient.count).to eq(0)
      end
    end
  end
end