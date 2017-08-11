get '/decks' do
  slim :'decks/index'
end

get '/decks/:id' do
  slim :'decks/show'
end
