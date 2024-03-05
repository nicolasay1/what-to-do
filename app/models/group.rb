class Group < ApplicationRecord
  has_secure_token :invite_token
  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members
  has_many :events
  has_many :proposals
  belongs_to :user

  validates :name, presence: true

  def member?(user)
    users.include?(user)
  end

  def to_params
    invite_token
  end

end
