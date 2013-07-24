# == Schema Information
#
# Table name: subscribes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Subscribe < ActiveRecord::Base
  attr_accessible :category, :user
  belongs_to :category
  belongs_to :user

  validates :category, :presence => true
  validates :user, :presence => true

end
