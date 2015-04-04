class Map < ActiveRecord::Base

  belongs_to :board
  belongs_to :map
  # has_many :map_areas

  # TODO spec
  validates :board_id, presence: true
  # TODO spec
  validates :match_id, presence: true
  # TODO spec
  validates :use_kings_court_overlay, inclusion: { in: [true, false] }

  # TODO spec
  def create_all_areas!
    # TODO
  end

end
