class AddPinnedToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :pinned, :boolean
  end
end
