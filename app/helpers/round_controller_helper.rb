def unanswered(cards, round)
  cards.select do |card|
    guesses = Guess.where(card_id: card.id, round_id: round.id)
    guesses.empty?
  end
end

def incorrect(cards, round)
  cards.select do |card|
    correct_guesses_for(card, round).empty?
  end
end

def correct_guesses_for(card, round)
  guesses = Guess.where(card_id: card.id, round_id: round.id)
  guesses.select do |guess|
    guess.is_correct == 't'
  end
end

def first_try_correct(round)
  guesses = round.guesses
  guesses = guesses.sort_by { |guess| guess.card_id }
  guesses = guesses.chunk { |guess| guess.card_id }
  guesses = guesses.to_a
  guesses.select { |guess| guess[1].count == 1 }.count
end
