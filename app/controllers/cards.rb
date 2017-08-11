get '/cards' do
  slim :'cards/index'
end

get '/cards/:id' do
  p '*' * 50
  p params
  @card = Card.find(params[:id])
  slim :'cards/show'
end

post '/cards/:id' do
  card = Card.find(params[:id])
  answer_correct = params[:guess] == card.answer
  Guess.create(card_id: card.id, is_correct: answer_correct)
  redirect "/cards/#{card.id}"
end
