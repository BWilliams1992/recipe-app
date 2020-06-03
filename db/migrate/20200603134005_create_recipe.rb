class CreateRecipe < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :method
      t.text :ingredients
      t.timestamps
    end
  end
end
