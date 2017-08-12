#create a new user

get '/users/new' do
  @user ||= User.new
  slim :'users/new'
end

post '/users' do
  params[:user][:hashed_password] = hash_password(params[:user][:hashed_password])
  @user = User.create(params[:user])
  if @user.errors.any?
    slim :'/users/new'
  else
    redirect '/users/login'
  end
end

#login

get '/users/login' do
  if logged_in?
    redirect '/users/profile'
  else
    slim :'users/login'
  end
end

post '/users/login' do
  @user = User.authenticate(params[:user][:user_name], params[:user][:hashed_password])
  halt(401, slim(:'users/401')) unless @user
  session[:user_id] = @user.id
  redirect '/users/profile'
end

#logout

post '/users/logout' do
  halt(404, slim(:'users/404')) unless logged_in?
  session[:user_id] = nil
  redirect '/users/login'
end

get '/users/profile' do
  halt(401, slim(:'users/401')) unless logged_in?
  slim :'users/profile'
end


