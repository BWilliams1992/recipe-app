class AddPrivateToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :private, :boolean, default: :false
  end
end
