class RenameTablesAndAddCounterCache < ActiveRecord::Migration
  def change
    rename_table :img_comments, :comments
    rename_table :img_categories, :categories

    rename_column :images, :img_category_id, :category_id
  end
end
