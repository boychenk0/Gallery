class Message < ActiveRecord::Base
  attr_accessible :body, :user
  belongs_to :user
end
