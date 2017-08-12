helpers do
  def get_stats
    rounds = current_user.rounds.sort_by { |round| round.deck_id }
    rounds = rounds.chunk { |round| round.deck_id }.to_a
    rounds = rounds.map { |round| round[1] }
  end
end
