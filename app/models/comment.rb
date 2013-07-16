class Comment < ActiveRecord::Base
  attr_accessible :body, :image, :created_at, :user
  belongs_to :image, :counter_cache => true
  belongs_to :user
  has_many :events, :as => :eventable, :dependent => :destroy
  validate :image, :presense => true, :numericality => {:only_integer => true}
  validate :body, :presense => true, :length => {:maximum => 500}
end
