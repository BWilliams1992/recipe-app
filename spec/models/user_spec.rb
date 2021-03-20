require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creating a new user model" do
    context "successfully" do
      it "is successful" do
        user = build_user
        expect(user.save).to be true
        expect(User.count).to eq(1)
      end
    end
    context "unsuccessfully" do
      it "is unsuccessful" do
        user = build_user
        user.email = nil
        expect(user.save).to be false
        expect(User.count).to eq(0)
      end
    end
  end

  describe "after_create" do
    xit "runs create_my_recipes_collection" do

    end
  end

  describe "methods" do
    context "create_my_recipes_collection" do
      it "creates the my recipes collection for the user which is managed by the application" do
        user = create_user
        expect(user.collections.count).to eq(1)
        expect(user.collections.first.title).to eq("My Recipes")
      end
    end
  end

  def build_user 
    build(:user)
  end

  def create_user
    create(:user)
  end
end