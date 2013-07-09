class RenameCommentAndCategory < ActiveRecord::Migration
  def up
    rename_table :_categories, :img_categories
    rename_table :_comments, :img_comments
  end

  def down
    rename_table :img_categories, :_categories
    rename_table :img_comments, :_comments
  end
end
