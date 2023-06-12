class Group < ApplicationRecord
  has_many :user_groups
  has_many :groups, through: :user_groups
  validates :groupname, presence:  true
end
