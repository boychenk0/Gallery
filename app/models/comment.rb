# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  image_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#

class Comment < ActiveRecord::Base

  attr_accessible :body, :image, :created_at, :user

  belongs_to :image, :counter_cache => true
  belongs_to :user
  has_many :events, :as => :eventable, :dependent => :destroy

  validates :image, :presence => true
  validates :body, :presence => true, :length => {:maximum => 500}
  paginates_per 5
end
