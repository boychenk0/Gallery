class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :images, :dependent => :delete_all
  has_many :subscribes, :dependent => :destroy
  has_many :users, :through => :subscribes

  validates :name, :presence => true, :uniqueness => true

  scope :category_sort, :order =>'images_count DESC'

end
