class User < ApplicationRecord
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true, uniqueness: true
  validates :password, length: {minimum: 7}
end
