class VictoryTrack < Track

  def self.setup!(match, board, players)
    track = self.new(match: match, board: board)

    one_castle, two_castles = [], []
    two_castles << 'Stark'
    one_castle << 'Baratheon'
    one_castle << 'Lannister'
    one_castle << 'Greyjoy' if players.size >= 4
    one_castle << 'Tyrell'  if players.size >= 5
    one_castle << 'Martell' if players.size == 6

    track.set_tokens(1, one_castle)
    track.set_tokens(2, two_castles)

    track.save!
    track
  end

  def set_tokens(value, *tokens)
    tokens.flatten!
    slots.each do |slot|
      if slot['value'] == value.to_s
        slot['tokens'] = tokens
      else
        tokens.each { |token| slot['tokens'].delete(token) }
      end
    end
    slots.detect { |slot| slot['value'] == value.to_s }
  end

  def tokens_at(value)
    slot = slots.detect { |slot| slot['value'] == value.to_s }
    slot['tokens']
  end

  private

  # called after object initialization (on new records only)
  # TODO spec
  def set_slots
    self.slots = [
      {value: '1', tokens: []},
      {value: '2', tokens: []},
      {value: '3', tokens: []},
      {value: '4', tokens: []},
      {value: '5', tokens: []},
      {value: '6', tokens: []},
      {value: '7', tokens: []}
    ]
  end

end
