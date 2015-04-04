class Board < ActiveRecord::Base

  belongs_to :match
  has_one :map
  # has_many :tracks
  # has_one: :wildlings_track              # single-token
  # has_one: :iron_throne_influence_track  # multi-token, ordered
  # has_one: :fiefdoms_influence_track     # multi-token, ordered
  # has_one: :kings_court_influence_track  # multi-token, ordered
  # has_one: :supply_track                 # multi-token, grouped
  # has_one: :round_track                  # single-token
  # has_one: :victory_track                # multi-token, grouped

  # TODO spec
  validates :match_id, presence: true

end
