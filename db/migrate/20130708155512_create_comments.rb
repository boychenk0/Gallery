class CreateComments < ActiveRecord::Migration
  def change
    create_table :_comments do |t|
      t.string :body
      t.integer :image_id

      t.timestamps
    end
  end
end
