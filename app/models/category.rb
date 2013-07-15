class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :images, :dependent => :delete_all
  validate :name, :presense => true, :uniqueness => true
  has_many :subscribes, :dependent => :destroy
  has_many :users, :through => :subscribes
end
