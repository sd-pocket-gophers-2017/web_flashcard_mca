get '/decks' do
  @decks = Deck.all
  slim :'decks/index'
end
