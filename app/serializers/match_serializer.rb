class MatchSerializer < ActiveModel::Serializer
  attributes :id, :round, :iron_throne_track, :fiefdoms_track, :kings_court_track
  has_one :board
  has_many :players
  has_many :garrisons
end
