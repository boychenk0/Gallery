class Navigation < ActiveRecord::Base
  attr_accessible :url
  has_many :events, :as => :eventable, :dependent => :destroy
end
