class MatchSerializer < ActiveModel::Serializer
  attributes :id, :round
  has_one :board
  has_many :players
end
