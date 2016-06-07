module TerritoryAssociation
  extend ActiveSupport::Concern

  included do
    attr_accessor :territory_id

    scope :by_territory, -> (slug) { where(territory: slug) }
    scope :without_territory, -> { where(territory: nil) }
  end

  def territory_id=(territory_slug)
    self.territory = territory_slug
  end
end
