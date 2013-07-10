class Like < ActiveRecord::Base
  attr_accessible :image_id, :user
  belongs_to :image, :counter_cache => true
  belongs_to :user
  validate :image, :presense => true, :numericality => {:only_integer => true}
  validate :user, :presense => true, :numericality => {:only_integer => true}
end
