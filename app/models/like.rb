class Like < ActiveRecord::Base
  attr_accessible :image_id, :status, :user_id
  belongs_to :image
end
