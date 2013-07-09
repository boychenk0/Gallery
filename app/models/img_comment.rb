class ImgComment < ActiveRecord::Base
  attr_accessible :body, :image
  belongs_to :image, :counter_cache => true
end
