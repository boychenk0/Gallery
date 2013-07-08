class CreateCategories < ActiveRecord::Migration
  def change
    create_table :_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
