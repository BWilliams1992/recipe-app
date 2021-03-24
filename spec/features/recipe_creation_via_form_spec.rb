require 'rails_helper'

feature "Creates a new recipe from the new recipe from which is saved to the database with the corresponding attributes" do
  scenario "successfully" do
    user = create(:user)
    login_as(user, :scope => :user)

    visit new_recipe_path

    expect(page).to have_css 'h1', text:'Create Recipe'

    fill_in "Title", with: "Pizza"
    fill_in "Description", with: "It's a pizza"
    fill_in "recipe_ingredients_attributes_0_name", with: "Pizza"
    fill_in "recipe_recipe_ingredients_attributes_0_amount", with: 1
    fill_in "Method", with: "Put in oven and cook it"

    click_on "Create Recipe"

    expect(Recipe.count).to eq(1)
    expect(Recipe.first.title).to eq("Pizza")
    expect(Recipe.first.description).to eq("It's a pizza")

  end
end