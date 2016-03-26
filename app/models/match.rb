class Match < ActiveRecord::Base

  has_many :players
  has_one :board
  # has_many :decks
  # has_one :wildlings_deck
  # has_one :westeros_one_deck
  # has_one :westeros_two_deck
  # has_one :westeros_three_deck
  # has_one :tides_of_battle_deck # optional

  scope :by_players, lambda { |player_ids| includes(:players).where(players: { id: player_ids }) }

  def self.serialize_with(serializer)
    ActiveModel::ArraySerializer.new(all, each_serializer: serializer)
  end
end
