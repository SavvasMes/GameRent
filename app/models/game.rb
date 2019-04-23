class Game < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_insensitive: false}
  validates_numericality_of :quantity, only_integer: true, greater_than_or_equal_to: 0

  belongs_to :game_category, validate:  true
  has_many :rents, dependent: :restrict_with_error
  default_scope {order :name}

  def avalable_qty
    self.quantity - self.rents.where(return_date: nil).count
  end
end
