class Unit < ActiveRecord::Base
  include RailsSTIModel

  pusherable :unit

  belongs_to :board
  belongs_to :player

  attr_accessor :territory_id

  scope :by_territory, -> (slug) { where(territory: slug) }
  scope :without_territory, -> { where(territory: nil) }

  def territory_id=(territory_slug)
    self.territory = territory_slug
  end
end
