nighthawk = File.readlines('db/nighthawk_flashcard_data.txt')

def format_txt(arr_of_str)
  arr_of_str.delete("\n")
  cards = arr_of_str.each_slice(2).to_a
  cards.each do |card|
    card.each do |string|
      string.chomp!
    end
  end
end

nighthawk_deck = Deck.create(name: 'Nighthawk')

nighthawk = format_txt(nighthawk)

keys = ['question', 'answer']

nighthawk = nighthawk.map { |card| keys.zip(card) }

nighthawk = nighthawk.map { |card| card.to_h }

nighthawk.each do |card|
  card["deck_id"] = nighthawk_deck.id
  Card.create(card)
end

# -------------------------------------
otter = File.readlines('db/otter_flashcard_data.txt')

otter_deck = Deck.create(name: 'Otter')

otter = format_txt(otter)


otter = otter.map { |card| keys.zip(card) }

otter = otter.map { |card| card.to_h }

otter.each do |card|
  card["deck_id"] = otter_deck.id
  Card.create(card)
end

# ---------------------------------------------
racoon = File.readlines('db/raccoon_flashcard_data.txt')

racoon_deck = Deck.create(name: 'Raccoon')

racoon = format_txt(racoon)

racoon = racoon.map { |card| keys.zip(card) }

racoon = racoon.map { |card| card.to_h }

racoon.each do |card|
  card["deck_id"] = racoon_deck.id
  Card.create(card)
end
