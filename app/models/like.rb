class Like < ActiveRecord::Base
  attr_accessible :image, :status, :user
  belongs_to :image
  belongs_to :user
end
