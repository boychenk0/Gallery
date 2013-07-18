class Comment < ActiveRecord::Base
  attr_accessible :body, :image, :created_at, :user
  belongs_to :image, :counter_cache => true
  belongs_to :user
  has_many :events, :as => :eventable, :dependent => :destroy

  #validates :image, :presence => true, :numericality => {:only_integer => true}
  validates :body, :presence => true, :length => {:maximum => 500}
end
