class AddRecipeToIngredient < ActiveRecord::Migration[6.0]
  def change
    add_reference :ingredients, :recipe, foreign_key: true
  end
end
