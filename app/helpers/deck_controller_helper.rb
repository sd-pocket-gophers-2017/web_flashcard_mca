def unanswered(cards)
  cards.select { |card| card.guesses.empty? }
end

def incorrect(cards)
  cards.select { |card| correct_guesses_for(card).empty? }
end

def correct_guesses_for(card)
  card.guesses.select { |guess| guess.is_correct == 't' }
end

def first_try_correct(deck)
  grouped_guesses = deck.guesses.group(:card_id).count(:guesses)
  grouped_guesses.select { |card, guess_count| guess_count == 1 }.count
end
