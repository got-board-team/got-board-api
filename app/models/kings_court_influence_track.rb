class KingsCourtInfluenceTrack < InfluenceTrack

  private

  # called after object initialization (on new records only)
  # TODO change start depending on match players count
  # TODO spec
  def set_slots
    self.slots = [
      {value: '1', token: '', stars: 3},
      {value: '2', token: '', stars: 3},
      {value: '3', token: '', stars: 2},
      {value: '4', token: '', stars: 1},
      {value: '5', token: '', stars: 0},
      {value: '6', token: '', stars: 0}
    ]
  end

end
