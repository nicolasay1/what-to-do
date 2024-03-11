class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user, uniqueness: { scope: :group,
    message: "User already in the group" }
end
