class Game < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_insensitive: false}
  validates :category, presence: true
end
