class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members
  has_many :events
  has_many :proposals
  belongs_to :user

  validates :name, presence: true
end
