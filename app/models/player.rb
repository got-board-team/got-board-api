class Player < ActiveRecord::Base

  # the order is important! DO NOT CHANGE!
  # it is used elsewhere, like in VictoryTrack.setup! for example
  HOUSES = %w( Baratheon Lannister Stark Greyjoy Tyrell Martell )

  belongs_to :match

  has_many :units
  # has_many :house_cards
  # has_many :available_house_cards,
  #   -> { where status: 'available' }, class_name: 'HouseCard'
  # has_many :discarded_house_cards,
  #   -> { where status: 'discarded' }, class_name: 'HouseCard'

  # has_many :power_tokens
  # has_many :available_power_tokens,
  #   -> { where status: 'available' }, class_name: 'PowerToken'
  # has_many :placed_power_tokens,
  #   -> { where status: 'placed' }, class_name: 'PowerToken'
  # has_many :pooled_power_tokens,
  #   -> { where status: 'pooled' }, class_name: 'PowerToken'

  # has_many :order_tokens
  # has_many :available_order_tokens,
  #   -> { where status: 'available' }, class_name: 'OrderToken'
  # has_many :placed_order_tokens,
  #   -> { where status: 'placed' }, class_name: 'OrderToken'

  # has_many :dominance_tokens # optionals
  # has_one :iron_throne_dominance_token,
  #   -> { where type: 'iron_throne' }, class_name: 'DominanceToken' # optional
  # has_one :fiefdoms_dominance_token,
  #   -> { where type: 'fiefdoms' }, class_name: 'DominanceToken' # optional
  # has_one :kings_court_dominance_token,
  #   -> { where type: 'kings_court' }, class_name: 'DominanceToken' # optional

  # has_many :units
  # has_many :available_units,
  #   -> { where status: 'available' }, class_name: 'Unit'
  # has_many :placed_units,
  #   -> { where status: 'placed' }, class_name: 'Unit'
  # has_many :ship_units,
  #   -> { where type: 'ship' }, class_name: 'Unit'
  # has_many :footman_units,
  #   -> { where type: 'footman' }, class_name: 'Unit'
  # has_many :knight_units,
  #   -> { where type: 'knight' }, class_name: 'Unit'
  # has_many :siege_engine_units,
  #   -> { where type: 'siege_engine' }, class_name: 'Unit'

  # TODO spec
  validates :match, presence: true
  # TODO spec
  validates :house, presence: true,
    inclusion: {in: HOUSES},
    uniqueness: {scope: :match_id}

end
