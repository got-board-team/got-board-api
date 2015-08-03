class Unit < ActiveRecord::Base
  pusherable :unit

  belongs_to :board
  belongs_to :player

  attr_accessor :territory_id

  validates_inclusion_of :type, in: %w(Footman Knight Boat SiegeEngine)

  scope :by_territory, -> (slug) { where(territory: slug) }
  scope :without_territory, -> { where(territory: nil) }

  def territory_id=(territory_slug)
    self.territory = territory_slug
  end
end
