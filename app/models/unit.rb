class Unit < ActiveRecord::Base
  include RailsSTIModel
  include TerritoryAssociation

  pusherable :unit

  belongs_to :board
  belongs_to :player
end
