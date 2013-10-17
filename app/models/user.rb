# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  dob        :date
#  gender     :string(255)
#  school     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

  attr_accessible :dob, :email, :gender, :name, :school, :password, :password_confirmation
   has_secure_password
   before_save { |user| user.email = email.downcase }
validates :name, presence: true, length: { maximum: 30 }
  validates :dob, :gender, :school, :password, :password_confirmation, presence: true
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  after_validation { self.errors.messages.delete(:password_digest) }

  
end