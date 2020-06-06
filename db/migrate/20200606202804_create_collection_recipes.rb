class CreateCollectionRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :collection_recipes do |t|
      t.integer :recipe_id
      t.integer :collection_id
    end
  end
end
