class CreateNavigations < ActiveRecord::Migration
  def change
    create_table :navigations do |t|
      t.string :url
    end
  end
end
