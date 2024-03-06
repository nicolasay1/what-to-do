class Group < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :events
  has_many :proposals
  belongs_to :user

  validates :name, presence: true
end
