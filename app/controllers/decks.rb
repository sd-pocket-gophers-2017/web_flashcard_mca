get '/decks' do
  @decks = Deck.all
  slim :'decks/index'
end

get '/decks/:id' do
  slim :'decks/show'
end

post '/decks/:id' do
  cards = Card.where(deck_id: params[:id])
  unanswered_cards = cards.select { |card| card.guesses.empty? }
  card = unanswered_cards.sample
  redirect "/cards/#{card.id}"
end
