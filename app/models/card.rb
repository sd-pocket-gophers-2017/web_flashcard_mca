class Card < ApplicationRecord
  # Remember to create a migration!
  belongs_to :deck
  has_many :guesses

  validates :question, :answer, presence: true
  validates :question, uniqueness: true
end
