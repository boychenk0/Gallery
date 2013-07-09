class Image < ActiveRecord::Base
  attr_accessible :comment_count, :likes_count, :url, :img_category
  has_many :img_comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  belongs_to :img_category
end
