class AddUserIdForComments < ActiveRecord::Migration
  def change
    add_column  :img_comments, :user_id, :integer
  end
end
