class Membership < ApplicationRecord
  belongs_to :client
  belongs_to :gym

  validates :gym_id, uniqueness: {scope: :client_id, message: "can't have more than one of the same client"}
end
