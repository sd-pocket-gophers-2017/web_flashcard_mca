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
    redirect "/cards/#{card.id}"
  else
    incorrect_cards = cards.select do |card|
      card.guesses.select { |guess| guess.is_correct == 't' }.empty?
    end
    if incorrect_cards.any?
      card = incorrect_cards.sample
      redirect "/cards/#{card.id}"
    else
      redirect "/decks/#{params[:id]}/results"
    end
  end
end

get '/decks/:id/results' do
  @deck = Deck.find(params[:id])
  grouped_guesses = @deck.guesses.group(:card_id).count(:guesses)
  @first_try = grouped_guesses.select { |card, guess_count| guess_count == 1 }.count
  slim :'decks/results'
end
