class Like < ApplicationRecord
  belongs_to :proposal
  belongs_to :user
end
