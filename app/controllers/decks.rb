get '/decks' do
  @decks = Deck.all
  slim :'decks/index'
end

get '/decks/:id' do
  slim :'decks/show'
end

post '/decks/:id' do
  cards = Card.where(deck_id: params[:id])

  unanswered_cards = unanswered(cards)
  incorrect_cards = incorrect(cards)

  if unanswered_cards.empty? && incorrect_cards.empty?
    redirect "/decks/#{params[:id]}/results"
  elsif unanswered_cards.any?
    card = unanswered_cards.sample
  else
    card = incorrect_cards.sample
  end
  redirect "/cards/#{card.id}"
end

get '/decks/:id/results' do
  @deck = Deck.find(params[:id])
  @first_try = first_try_correct(@deck)
  slim :'decks/results'
end
