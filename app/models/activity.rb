class Activity < ApplicationRecord
  has_many :users, through: :saves
  has_many :groups, through: :events
  has_many :groups, through: :proposals
end
