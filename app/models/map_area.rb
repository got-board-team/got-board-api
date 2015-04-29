class MapArea < ActiveRecord::Base

  belongs_to :match
  belongs_to :map

  # TODO spec
  validates :match, presence: true
  # TODO spec
  validates :map, presence: true
  # TODO spec
  validates :slug, presence: true,
    uniqueness: {scope: :map_id, case_sensitive: false},
    format: {with: /\A[a-z_]+\z/}
  # TODO spec
  validates :type, presence: true
  # TODO spec
  validates :fortification_type,
    inclusion: { in: %w( castle stronghold ) }, allow_blank: true
  # TODO spec
  validates :barrels_count,
    presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to: 0}
  # TODO spec
  validates :crowns_count,
    presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to: 0}
  # TODO spec
  validates :house_sigil,
    inclusion: { in: Player::HOUSES }, allow_blank: true

  # TODO spec
  # Creates an MapArea from a fixture loaded from
  # `config/game_data/map_areas.yml`.
  # TODO: how to establish the relationship between a port and it's land?
  def self.create_from_fixture!(map, fixture)
    klass = fixture['type'].constantize
    klass.create!(map: map, match: map.match, slug: fixture['slug'],
      fortification_type: fixture['fortification_type'],
      barrels_count: fixture['barrels_count'],
      crowns_count: fixture['crowns_count'],
      house_sigil: fixture['house_sigil']
    )
  end

  def has_fortification?
    !fortification_type.blank?
  end

  def has_castle?
    has_fortification? && fortification_type == 'castle'
  end

  def has_stronghold?
    has_fortification? && fortification_type == 'stronghold'
  end

  def has_port?
    !port_owner_id.blank?
  end

  def has_crowns?
    crowns_count > 0
  end

  def has_barrels?
    barrels_count > 0
  end

  def house_seat?
    !house_sigil.blank?
  end

  def name
    I18n.t("map_areas.#{slug}") # TODO
    # QUESTION: move language-specific data to Rails i18n files? or leave it
    # all on the config/map_areas.yml file?
  end

end
