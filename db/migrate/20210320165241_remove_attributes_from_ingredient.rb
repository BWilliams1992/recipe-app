class RemoveAttributesFromIngredient < ActiveRecord::Migration[6.0]
  def change
    remove_column :ingredients, :amount, :integer
    remove_column :ingredients, :measure, :string
    remove_reference :ingredients, :recipe
  end
end
