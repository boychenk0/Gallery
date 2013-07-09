class ImgComment < ActiveRecord::Base
  attr_accessible :body, :image
  belongs_to :image, :counter_cache => true
  #validate :image, :presense => true, :numericality => {:only_integer => true}
  #validate :body, :presense => true, :length => {:maximum => 500}
end
