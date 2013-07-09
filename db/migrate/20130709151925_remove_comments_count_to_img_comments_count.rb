class RemoveCommentsCountToImgCommentsCount < ActiveRecord::Migration
  def change
    rename_column :images, :comments_count, :img_comments_count
  end
end
