class Deck < ApplicationRecord
  # Remember to create a migration!
  has_many :cards

  validates :name, presence: true, uniqueness: true
end
