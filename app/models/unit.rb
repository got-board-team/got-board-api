class Unit < ActiveRecord::Base
  belongs_to :board
  belongs_to :player

  scope :by_territory, -> (slug) { where(territory: slug) }
end
