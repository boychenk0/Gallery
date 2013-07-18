class Like < ActiveRecord::Base
  attr_accessible :image_id, :user
  belongs_to :image, :counter_cache => true
  belongs_to :user
  has_many :events, :as => :eventable, :dependent => :destroy
  validates :image, :presence => true, :numericality => {:only_integer => true}
  validates :user, :presence => true, :numericality => {:only_integer => true}
  validates :image_id, :uniqueness => {:scope => :user_id }
end
