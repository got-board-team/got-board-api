class RoundTrack < Track

  private

  # called after object initialization (on new records only)
  # TODO spec
  def set_slots
    self.slots = [
      {value:  '1', token: false},
      {value:  '2', token: false},
      {value:  '3', token: false},
      {value:  '4', token: false},
      {value:  '5', token: false},
      {value:  '6', token: false},
      {value:  '7', token: false},
      {value:  '8', token: false},
      {value:  '9', token: false},
      {value: '10', token: false}
    ]
  end

end
