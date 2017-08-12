# get '/' do
#   # Look in app/views/index.erb
#   slim :index
# end

#create a new user
get '/users/new' do
  slim :'users/new'
end

post '/users' do
  params[:user][:hashed_password] = hash_password(params[:user][:hashed_password])
  @user = User.create(params[:user])
  redirect '/users/login'
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
  if @user
    session[:user_id] = @user.id
    redirect '/users/profile'
  else
    @errors = ['Login failed']
    puts "We got errors, here they are #{@errors}"
    slim :'users/login'
  end
end
#logout
get '/users/logout' do
  slim :'users/logout'
end

post '/users/logout' do
  session[:user_id] = nil
  redirect '/users/login'
end

get '/users/profile' do
  if session[:user_id] == nil
    redirect '/users/login'
  else
    slim :'users/profile'
  end
end


