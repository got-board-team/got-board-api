class MatchSerializer < ActiveModel::Serializer
  attributes :id
  has_one :board
  has_many :players
end
