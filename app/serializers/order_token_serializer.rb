class OrderTokenSerializer < ActiveModel::Serializer
  attributes :id,
    :type,
    :board_id,
    :player_id,
    :territory,
    :x,
    :y,
    :faceup
end

