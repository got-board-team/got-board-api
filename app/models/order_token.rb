class OrderToken < ActiveRecord::Base

  TOKEN_TYPES = [ "Consolidate",
                  "ConsolidateP",
                  "Defend",
                  "DefendP",
                  "March",
                  "MarchM",
                  "MarchP",
                  "Raid",
                  "RaidP",
                  "Support",
                  "SupportP" ]

  pusherable :order_token

  belongs_to :board
  belongs_to :player

  attr_accessor :territory_id

  validates_inclusion_of :type, in: TOKEN_TYPES

  scope :by_territory, -> (slug) { where(territory: slug) }
  scope :without_territory, -> { where(territory: nil) }

  def territory_id=(territory_slug)
    self.territory = territory_slug
  end
end
