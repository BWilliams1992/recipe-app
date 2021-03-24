class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.float :amount
      t.string :measure

      t.timestamps
    end
  end
end
