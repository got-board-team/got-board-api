class UnitSerializer < ActiveModel::Serializer
  attributes :id, :type, :territory, :house, :x, :y

  def type
    object.type.downcase
  end

  def house
    object.player.house.downcase
  end
end