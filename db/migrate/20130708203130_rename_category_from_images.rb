class RenameCategoryFromImages < ActiveRecord::Migration
  def up
    rename_column :images, :_category_id, :img_category_id
  end

  def down
    rename_column :images, :img_category_id, :_category_id
  end
end
