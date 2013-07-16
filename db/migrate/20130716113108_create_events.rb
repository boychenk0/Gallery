class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id, :null => false
      t.string :eventable_type, :null => false
      t.integer :eventable_id, :null => false
      t.datetime :created_at, :null => false
    end
  end
end
