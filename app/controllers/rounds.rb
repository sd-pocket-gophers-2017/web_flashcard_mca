get '/rounds' do
  slim :'rounds/index'
end

get '/rounds/:id' do
  @round = Round.find(params[:id])
  cards = Card.where(deck_id: @round.deck.id)
  @first_try = first_try_correct(@round)

  unanswered_cards = unanswered(cards, @round)
  incorrect_cards = incorrect(cards, @round)

  if unanswered_cards.empty? && incorrect_cards.empty?
    slim :'rounds/results'
  elsif unanswered_cards.any?
    @card = unanswered_cards.sample
    slim :'rounds/show'
  else
    @card = incorrect_cards.sample
    slim :'rounds/show'
  end
end

post '/rounds/new' do
  deck = Deck.find_by(name: params[:round][:deck_name])
  if logged_in?
    user = current_user
  else
    user = User.find_or_create_by(user_name: 'anonymous', hashed_password: 'password')
  end
  round = Round.create(user_id: user.id, deck_id: deck.id)
  redirect "/rounds/#{round.id}"
end

post '/rounds/:round_id/cards/:card_id' do
  card = Card.find(params[:card_id])
  answer_correct = params[:guess] == card.answer
  Guess.create(card_id: card.id, round_id: params[:round_id], is_correct: answer_correct)
  redirect "/rounds/#{params[:round_id]}/cards/#{card.id}/answer"
end

get '/rounds/:round_id/cards/:card_id/answer' do
  @card = Card.find(params[:card_id])
  @round = Round.find(params[:round_id])
  slim :'rounds/answer'
end
