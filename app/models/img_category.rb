class ImgCategory < ActiveRecord::Base
  attr_accessible :name
  has_many :images
  validate :name, :presense => true, :uniqueness => true
end
