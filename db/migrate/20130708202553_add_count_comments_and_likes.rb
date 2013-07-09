class AddCountCommentsAndLikes < ActiveRecord::Migration
  def change
    remove_column :images, :likes
    remove_column :images, :comment_count

    add_column :images, :likes_count, :integer, :default => 0
    add_column :images, :comments_count, :integer, :default => 0

    Image.reset_column_information
    Image.find(:all).each do |i|
      Image.update_counters i.id, :likes_count => i.likes.lenght
    end
    Image.reset_column_information
    Image.find(:all).each do |c|
      Image.update_counters c.id, :comments_count => c.comments.lenght
    end
  end
end
