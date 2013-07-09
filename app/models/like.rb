class Like < ActiveRecord::Base
  attr_accessible :image, :status, :user
  belongs_to :image, :counter_cache => true
  belongs_to :user
end
