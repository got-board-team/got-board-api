class OrderToken < ActiveRecord::Base
  pusherable :order_token

  belongs_to :board
  belongs_to :player

  attr_accessor :territory_id

  validates_inclusion_of :type, in: %w(March MarchM MarchP Defend DefendP Support SupportP Raid RaidP ConsolidatePower ConsolidatePowerP)

  scope :by_territory, -> (slug) { where(territory: slug) }
  scope :without_territory, -> { where(territory: nil) }

  def territory_id=(territory_slug)
    self.territory = territory_slug
  end
end
