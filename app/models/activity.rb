class Activity < ApplicationRecord
  has_many :users, through: :saves
end
