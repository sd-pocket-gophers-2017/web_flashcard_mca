get '/decks' do
  @decks = Deck.all
  slim :'decks/index'
end

get '/decks/:id' do
  slim :'decks/show'
end
