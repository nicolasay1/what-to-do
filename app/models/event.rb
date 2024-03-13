class Event < ApplicationRecord
  belongs_to :group
  belongs_to :activity
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
  has_one :user
end
