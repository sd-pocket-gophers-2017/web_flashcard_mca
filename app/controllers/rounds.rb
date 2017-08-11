get '/rounds' do
  slim :'rounds/index'
end

get '/rounds/:id' do
  slim :'rounds/show'
end
