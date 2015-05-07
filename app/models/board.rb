# TODO spec
class Board < ActiveRecord::Base

  belongs_to :match

  has_many :units
  has_many :tracks

  has_one :wildlings_track              # single-token
  has_one :iron_throne_influence_track  # multi-token, ordered
  has_one :fiefdoms_influence_track     # multi-token, ordered
  has_one :kings_court_influence_track  # multi-token, ordered
  has_one :supply_track                 # multi-token, grouped
  has_one :round_track                  # single-token
  has_one :victory_track                # multi-token, grouped

  validates :match, presence: true

  def territories
    file_path = 'config/game_data/map_areas.yml'
    @fixtures ||= YAML.load_file(File.join(Rails.root, file_path))
    @fixtures['map_areas']
  end

end
