# == Schema Information
#
# Table name: subscribes
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#

class Subscribe < ActiveRecord::Base

  attr_accessible :category, :user

  belongs_to :category
  belongs_to :user

  validates :category, :presence => true
  validates :user, :presence => true

end
