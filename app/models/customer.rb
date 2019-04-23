class Customer < ApplicationRecord
  validates_presence_of :name
  validates :uid, presence: true, uniqueness: {case_sensitive: false}
  validates :birthdate, presence: true, numericality: {only_integer: true}
  default_scope {order :name}
end
