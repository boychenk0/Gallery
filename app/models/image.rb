class Image < ActiveRecord::Base
  attr_accessible :url, :img_category
  mount_uploader :url, ImageUploader
  has_many :img_comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  belongs_to :img_category
  validate :url, :presense => true
  validate :img_category, :presense => true
  validate :img_category, :numericality => {:only_integer => true}
end
