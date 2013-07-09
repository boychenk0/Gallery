class ImgComment < ActiveRecord::Base
  attr_accessible :body, :image_id
  belongs_to :image
end
