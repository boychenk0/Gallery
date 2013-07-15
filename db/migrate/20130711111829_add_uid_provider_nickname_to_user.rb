class AddUidProviderNicknameToUser < ActiveRecord::Migration
  def change
    add_column  :users, :uid, :float
    add_column  :users, :provider, :string
    add_column  :users, :nickname, :string
  end
end
