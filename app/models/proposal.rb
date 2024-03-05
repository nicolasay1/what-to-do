class Proposal < ApplicationRecord
  belongs_to :group
  belongs_to :activity
  has_many :likes
  has_many :users, through: :likes
end
