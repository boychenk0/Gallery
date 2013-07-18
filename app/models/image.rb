class Image < ActiveRecord::Base
  attr_accessible :url, :category
  mount_uploader :url, ImageUploader

  has_many :comments, :dependent => :destroy

  has_many :likes, :dependent => :destroy
  has_many :users, :through => :likes

  belongs_to :category, :counter_cache => true

  validates :url, :presence => true
  validates :category, :presence => true
  #validates :category, :numericality => {:only_integer => true}

  after_save :notification
  def notification
    SubscribeMailer.new_image(self.category.users, self.category, self).deliver
  end
end
