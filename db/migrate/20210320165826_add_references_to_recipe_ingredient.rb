class AddReferencesToRecipeIngredient < ActiveRecord::Migration[6.0]
  def change
    drop_table :recipe_ingredients
    create_join_table :recipes, :ingredients, column_options: { null: true }, table_name: :recipe_ingredients
  end
end
