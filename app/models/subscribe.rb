class Subscribe < ActiveRecord::Base
  attr_accessible :category, :user
  belongs_to :category
  belongs_to :user

  validates :category, :presence => true
  validates :user, :presence => true

end
