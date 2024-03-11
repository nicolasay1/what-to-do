class Activity < ApplicationRecord
  has_many :events
  has_many :saves
  has_many_attached :photos
end
