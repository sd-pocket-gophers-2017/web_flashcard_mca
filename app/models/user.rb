class User < ApplicationRecord
  # Remember to create a migration!
  has_many :rounds
  has_many :guesses, through: :rounds

  validates :user_name, :hashed_password, presence: true
  validates :user_name, uniqueness: true

  def self.find_user(user_name)
    User.find_by(:user_name => user_name)
  end

  def password_object
    @password_object ||= BCrypt::Password.new(hashed_password)
  end

  def self.authenticate(user_name, password)
    @user = find_user(user_name)
    # puts @user.inspect
    return @user if @user && @user.password_object.==(password)
    nil
  end
end
