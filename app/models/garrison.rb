class Garrison < ActiveRecord::Base
  include TerritoryAssociation
  belongs_to :match
end
