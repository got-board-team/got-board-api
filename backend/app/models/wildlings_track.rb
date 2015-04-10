class WildlingsTrack < Track

  def self.setup!(match, board, players=nil)
    track = self.new(match: match, board: board)
    track.token_at = '0'
    track.save!
    track
  end

  def token_at=(value)
    slots.each do |slot|
      slot['value'] == value ? slot['token'] = true : slot['token'] = false
    end
    value
  end

  def token_at
    slot = slots.detect { |slot| slot['token'] == true }
    slot['value']
  end

  private

  # called after object initialization (on new records only)
  # TODO spec
  def set_slots
    self.slots = [
      {value:  '0', token: false},
      {value:  '2', token: false},
      {value:  '4', token: false},
      {value:  '6', token: false},
      {value:  '8', token: false},
      {value: '10', token: false},
      {value: '12', token: false}
    ]
  end

end
