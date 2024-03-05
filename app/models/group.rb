class Group < ApplicationRecord
  belongs_to :user
  has_many :users, through: :group_members

  validates :name, presence: true
end
