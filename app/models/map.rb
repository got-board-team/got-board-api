class Map < ActiveRecord::Base

  belongs_to :match
  has_many :map_areas

  # TODO spec
  validates :match, presence: true
  # TODO spec
  validates :board, presence: true
  # TODO spec
  validates :use_kings_court_overlay, inclusion: { in: [true, false] }

  # TODO spec
  # Reads info from `config/game_data/map_areas.yml` and creates all map areas related to
  # this map.
  # TODO: how to establish the relationship between a port and it's land?
  def create_all_areas!(area_class=MapArea)
    ActiveRecord::Base.transaction do
      fixtures.each do |fixture|
        area_class.create_from_fixture!(self, fixture)
      end
    end
  end

  # TODO spec
  def territories(file_path='config/game_data/map_areas.yml')
    @fixtures ||= YAML.load_file(File.join(Rails.root, file_path))
    @fixtures['map_areas']
  end

  private

  def fixtures(file_path='config/game_data/map_areas.yml')
    @fixtures ||= YAML.load_file(File.join(Rails.root, file_path))
    @fixtures['map_areas']
  end

end
