class AddImagesCount < ActiveRecord::Migration
  def change
    rename_column :images, :img_comments_count, :comments_count

    add_column :categories, :images_count, :integer, :default => 0

    Category.reset_column_information
    Category.find(:all).each do |i|
      Category.update_counters i.id, :images_count => i.images.count
    end
  end
end
