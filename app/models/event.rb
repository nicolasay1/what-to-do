class Event < ApplicationRecord
  belongs_to :group
  belongs_to :activity
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
end
