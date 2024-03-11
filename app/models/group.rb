class Group < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :events, dependent: :destroy
  has_many :proposals, dependent: :destroy
  belongs_to :user
  has_one :chatroom

  validates :name, presence: true

  has_secure_token :invite_token

  has_one_attached :banner

end
