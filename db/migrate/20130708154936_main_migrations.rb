class MainMigrations < ActiveRecord::Migration
  def change

    create_table :images do |t|
      t.string   :url, :null => false
      t.integer  :comments_count, :default => 0, :null => false
      t.integer  :likes_count, :default => 0, :null => false
      t.integer  :category_id, :null => false
      t.datetime :created_at, :null => false
    end


    create_table :categories do |t|
      t.string :name, :null => false
      t.integer :images_count, :default => 0, :null => false
      t.datetime :created_at, :null => false
    end

    create_table :comments do |t|
      t.text :body, :null=>false
      t.integer :image_id, :null => false
      t.integer :user_id, :null => false
      t.datetime :created_at, :null => false
    end

    create_table :likes do |t|
      t.integer :user_id, :null => false
      t.integer :image_id, :null => false
      t.datetime :created_at, :null => false
    end

    create_table :subscribes do |t|
      t.integer :user_id, :null => false
      t.integer :category_id, :null => false
      t.datetime :created_at, :null => false
    end

    create_table :events do |t|
      t.integer :user_id, :null => false
      t.string :eventable_type, :null => false
      t.integer :eventable_id, :null => false
      t.datetime :created_at, :null => false
    end

    create_table :navigations do |t|
      t.string :url, :null => false
    end

    create_table :messages do |t|
      t.string :body, :null => false
      t.integer :user_id, :null => false
      t.datetime :created_at, :null => false
    end

    add_index :images, :category_id
    add_index :comments, :image_id
    add_index :comments, :user_id
    add_index :likes, :image_id
    add_index :likes, :user_id
    add_index :subscribes, :category_id
    add_index :subscribes, :user_id
    add_index :events, :user_id
    add_index :events, [:eventable_type, :eventable_id]
    add_index :messages, :user_id

    #Image.reset_column_information
    #Image.each do |i|
    #  Image.update_counters i.id, :likes_count => i.likes.lenght
    #end
    #Image.reset_column_information
    #Image.each do |c|
    #  Image.update_counters c.id, :comments_count => c.comments.lenght
    #end
    #Category.reset_column_information
    #Category.each do |i|
    #  Category.update_counters i.id, :images_count => i.images.count
    #end
  end
end
