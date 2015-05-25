class KingsCourtInfluenceTrack < InfluenceTrack

  # The King’s Court Overlay Balances the availability of Special Order
  # tokens in three and four players games (Rulebook, pages 3 and 28).
  validates :use_kings_court_overlay, inclusion: { in: [true, false] }

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
