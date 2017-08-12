helpers do

  def hash_password(password)
    BCrypt::Password.create(password)
  end

end

