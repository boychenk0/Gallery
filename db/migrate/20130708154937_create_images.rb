class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.integer :comment_count
      t.integer :likes
      t.integer :_category_id

      t.timestamps
    end
  end
end
