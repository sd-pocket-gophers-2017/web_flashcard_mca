get '/users' do
  slim :'users/index'
end

get '/users/:id' do
  slim :'users/show'
end
