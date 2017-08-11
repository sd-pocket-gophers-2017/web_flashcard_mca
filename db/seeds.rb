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

deck = Deck.create(name: 'Nighthawk')

nighthawk = format_txt(nighthawk)

keys = ['question', 'answer']

nighthawk = nighthawk.map { |card| keys.zip(card) }

nighthawk = nighthawk.map { |card| card.to_h }

nighthawk.each do |card|
  card["deck_id"] = deck.id
  Card.create(card)
end
