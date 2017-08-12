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
  if unanswered_cards.any?
    card = unanswered_cards.sample
  else
    incorrect_cards = cards.select do |card|
      card.guesses.select { |guess| guess.is_correct == 't' }.empty?
    end
    card = incorrect_cards.sample
  end
  redirect "/cards/#{card.id}"
end
