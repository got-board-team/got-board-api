class UnitSerializer < ActiveModel::Serializer
  attributes :id, :type, :house, :x, :y

  def type
    object.type.downcase
  end

  def house
    object.player.house.downcase
  end
end
