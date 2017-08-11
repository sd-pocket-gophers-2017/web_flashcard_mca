class Round < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user
  has_many :guesses
end
