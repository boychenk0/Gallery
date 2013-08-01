# == Schema Information
#
# Table name: navigations
#
#  id  :integer          not null, primary key
#  url :string(255)      not null
#

class Navigation < ActiveRecord::Base
  attr_accessible :url
  has_many :events, :as => :eventable, :dependent => :destroy

  validates :url, :presence => true, :uniqueness => true
end
