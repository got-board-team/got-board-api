class UnitSerializer < ActiveModel::Serializer
  attributes :id, :type, :board_id, :player_id, :territory, :x, :y
end
