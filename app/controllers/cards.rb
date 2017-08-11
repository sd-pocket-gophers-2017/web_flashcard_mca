get '/cards' do
  slim :'cards/index'
end

get '/cards/:id' do
  slim :'cards/show'
end
