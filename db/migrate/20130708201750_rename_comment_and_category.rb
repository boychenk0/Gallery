class RenameCommentAndCategory < ActiveRecord::Migration
  def up
    rename_table :_categories, :categories
    rename_table :_comments, :img_comments
  end

  def down
    rename_table :categories, :_categories
    rename_table :img_comments, :_comments
  end
end
