class AddDescriptionToCollections < ActiveRecord::Migration[6.0]
  def change
    add_column :collections, :description, :text
  end
end
