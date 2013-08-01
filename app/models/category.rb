# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  images_count :integer          default(0), not null
#  created_at   :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :images, :dependent => :destroy
  has_many :subscribes, :dependent => :destroy
  has_many :users, :through => :subscribes

  validates :name, :presence => true, :uniqueness => true

  scope :category_sort_by_images_count, :order =>'images_count DESC'

end
