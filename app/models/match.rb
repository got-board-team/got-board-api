class Match < ActiveRecord::Base

  has_many :players
  has_one :board
  has_one :map
  # has_many :decks
  # has_one :wildlings_deck
  # has_one :westeros_one_deck
  # has_one :westeros_two_deck
  # has_one :westeros_three_deck
  # has_one :tides_of_battle_deck # optional

end
