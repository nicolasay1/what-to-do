class Proposal < ApplicationRecord
  belongs_to :group
  belongs_to :activity # took off second group
end
