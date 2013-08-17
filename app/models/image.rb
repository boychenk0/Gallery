# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  url            :string(255)      not null
#  comments_count :integer          default(0), not null
#  likes_count    :integer          default(0), not null
#  category_id    :integer          not null
#  created_at     :datetime         not null
#

class Image < ActiveRecord::Base
  attr_accessible :url, :category

  mount_uploader :url, ImageUploader

  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :users, :through => :likes
  belongs_to :category, :counter_cache => true

  validates :url, :presence => true
  validates :category, :presence => true


  after_save :notification
  def notification
    SubscribeMailer.new_image(self.category.users, self.category, self).deliver if !self.category.users.blank?
  end
end
