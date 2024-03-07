class Like < ApplicationRecord
  belongs_to :proposal
  belongs_to :user

  validates :user, uniqueness: { scope: :proposal }
end
