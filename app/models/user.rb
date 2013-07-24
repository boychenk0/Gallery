# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  uid                    :float
#  provider               :string(255)
#  nickname               :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  apply_simple_captcha
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :uid, :provider, :nickname, :captcha, :captcha_key
  has_many :images, :through => :likes
  has_many :categories, :through => :subscribes
  has_many :comments, :dependent => :destroy
  has_many :subscribes, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :events, :dependent=>:destroy
  has_many :messages, :dependent=>:destroy

  validates :nickname, :presence => true
end
