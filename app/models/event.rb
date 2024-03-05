class Event < ApplicationRecord
  belongs_to :group
  belongs_to :activity
  has_many :attendances
  has_many :users, through: :attendances
end
