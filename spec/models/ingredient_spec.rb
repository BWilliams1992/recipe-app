require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "Creating a new ingredient" do
    context "successfully" do
      it "is successful" do
        ingredient = create(:cabbage)
        expect(Ingredient.count).to eq(1)
      end
    end
  end
end