class Comment < ActiveRecord::Base
  attr_accessible :body, :image, :created_at, :user
  belongs_to :image, :counter_cache => true
  validate :image, :presense => true, :numericality => {:only_integer => true}
  validate :body, :presense => true, :length => {:maximum => 500}
  belongs_to :user
end
