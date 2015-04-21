class FiefdomsInfluenceTrack < InfluenceTrack

  private

  # called after object initialization (on new records only)
  # TODO spec
  def set_slots
    self.slots = [
      {value: '1', token: ''},
      {value: '2', token: ''},
      {value: '3', token: ''},
      {value: '4', token: ''},
      {value: '5', token: ''},
      {value: '6', token: ''}
    ]
  end

end
