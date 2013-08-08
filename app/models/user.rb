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
#  uid                    :float            default(0.0)
#  provider               :string(255)      default("")
#  nickname               :string(255)      default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  apply_simple_captcha
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :uid, :provider, :nickname, :captcha, :captcha_key, :avatar

  has_attached_file :avatar, :styles => {:small => '100x100>',
                                        :url  => '/assets/users/:id/:style/:basename.:extension',
                                        :path => ':rails_root/public/assets/users/:id/:style/:basename.:extension'}
  #validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 3.megabyte
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/jpg']

  has_many :images, :through => :likes
  has_many :categories, :through => :subscribes
  has_many :comments, :dependent => :destroy
  has_many :subscribes, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :events, :dependent=>:destroy
  has_many :messages, :dependent=>:destroy

  validates :nickname, :presence => true

  def avatar_from_url(url)
    self.avatar = open(url)
  end
end
