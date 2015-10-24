# TODO spec
class Board < ActiveRecord::Base

  belongs_to :match

  has_many :units
  has_many :order_tokens
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
    @territories ||= fetch_territories
  end

  private

  def fetch_territories
    map_file_path = 'config/game_data/map_areas.yml'
    map = YAML.load_file(File.join(Rails.root, map_file_path))
    map.with_indifferent_access['map_areas'].map do |territory_data|
      territory = Territory.new(self)
      territory.assign_attributes(
        id: territory_data[:id],
        slug: territory_data[:slug],
        path: territory_data[:path],
      )
      territory
    end
  end

end
