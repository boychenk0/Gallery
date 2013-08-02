# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  image_id   :integer          not null
#  created_at :datetime         not null
#

class Like < ActiveRecord::Base
  attr_accessible :image_id, :user_id

  belongs_to :image, :counter_cache => true
  belongs_to :user
  has_many :events, :as => :eventable, :dependent => :destroy

  validates :image, :presence => true
  validates :user, :presence => true
  validates :image_id, :uniqueness => {:scope => :user_id }
end
