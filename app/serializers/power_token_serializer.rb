class PowerTokenSerializer < ActiveModel::Serializer
  attributes :id,
    :board_id,
    :player_id,
    :territory,
    :x,
    :y
end
