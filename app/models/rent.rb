class Rent < ApplicationRecord
  belongs_to :game
  belongs_to :customer
  default_scope {order created_at: :desc}
end
