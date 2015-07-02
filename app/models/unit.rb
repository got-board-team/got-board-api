class Unit < ActiveRecord::Base
  belongs_to :board
  belongs_to :player

  scope :by_territory, -> (slug) { where(territory: slug) }

  validates_inclusion_of :type, in: %w(Footman Knight Boat SiegeEngine)

  pusherable :unit
end
