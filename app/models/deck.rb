class Deck < ApplicationRecord
  # Remember to create a migration!
  has_many :cards
  has_many :guesses, through: :cards

  validates :name, presence: true, uniqueness: true
end
