get '/guesses' do
  slim :'guesses/index'
end

get '/guesses/:id' do
  slim :'guesses/show'
end
