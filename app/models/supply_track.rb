class SupplyTrack < Track

  private

  # called after object initialization (on new records only)
  # TODO spec
  def set_slots
    self.slots = [
      {value: '0', tokens: [], armies: [2,2]},
      {value: '1', tokens: [], armies: [3,2]},
      {value: '2', tokens: [], armies: [3,2,2]},
      {value: '3', tokens: [], armies: [3,2,2,2]},
      {value: '4', tokens: [], armies: [3,3,2,2]},
      {value: '5', tokens: [], armies: [4,3,2,2]},
      {value: '6', tokens: [], armies: [4,3,2,2,2]}
    ]
  end

end
