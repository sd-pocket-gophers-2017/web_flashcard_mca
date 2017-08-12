helpers do
private
  def hash_password(password)
    BCrypt::Password.create(password)
  end

end

