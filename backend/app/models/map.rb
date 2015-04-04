class Map < ActiveRecord::Base

  belongs_to :match
  belongs_to :board
  # has_many :map_areas

  # TODO spec
  validates :match_id, presence: true
  # TODO spec
  validates :board_id, presence: true
  # TODO spec
  validates :use_kings_court_overlay, inclusion: { in: [true, false] }

  # TODO spec
  # Reads info from config/map_areas.yml and creates all map areas related to
  # this map.
  def create_all_areas!
    # TODO
  end

end
