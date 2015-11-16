class PowerToken < ActiveRecord::Base
  include TerritoryAssociation

  pusherable :power_token

  belongs_to :board
  belongs_to :player
end
