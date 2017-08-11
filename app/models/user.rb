class User < ApplicationRecord
  # Remember to create a migration!
  has_many :rounds
  has_many :guesses, through: :rounds

  validates :user_name, :password, presence: true
  validates :user_name, uniqueness: true
end
