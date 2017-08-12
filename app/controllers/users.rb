# get '/' do
#   # Look in app/views/index.erb
#   slim :index
# end

#create a new user
get '/users/new' do
  slim :'users/new'
end

post '/users' do
  p '*' * 50
  params[:user][:hashed_password] = hash_password(params[:user][:hashed_password])
  @user = User.create(params[:user])
  redirect '/users/login'
end
#login
get '/users/login' do
  slim :'users/login'
end

post '/users/login' do
  @user = User.authenticate(params[:user][:user_name], params[:user][:hashed_password])
  if @user
    session[:user_id] = @user.id
    redirect '/users/profile'
  else
    @errors = ['Login failed']
    puts "We got errors, here they are #{@errors}"
    slim :'users/login' #make this an error page
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
  #Rack::Utils.escape_html current_user.inspect
  if session[:user_id] == nil
    redirect '/users/login'
  else
    slim :'users/profile'
  end
end










# post '/users' do
#   params[:user][:password] = hash_password(params[:user][:password])
#   @user = User.create(params[:user])
#   redirect '/'
# end

# get '/users/signin' do
#   slim :signin
# end

# post '/users/signin' do
#   @user = authenticate(params[:user][:email], params[:user][:password])
#   if @user
#     session[:user_id] = @user.id
#     redirect '/secret'
#   else
#     redirect '/users/signin' #make this an error page
#   end
# end

# get '/secret' do
#   if session[:user_id]
#   else
#     redirect '/users/signin'
#   end
#   slim :secret
# end

# post '/signout' do

#   session[:user_id] = nil
#   redirect '/'
# end
# get '/users' do
#   slim :'users/index'
# end

# get '/users/:id' do
#   slim :'users/show'
# end
