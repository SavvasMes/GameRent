class GameCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_insensitive: false}
  has_many :games, dependent: :restrict_with_error
  default_scope {order :name}
end
