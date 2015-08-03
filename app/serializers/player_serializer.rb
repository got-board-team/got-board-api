class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :house, :units

  def units
    object.units.without_territory.map do |unit|
      UnitSerializer.new(unit).as_json["unit"]
    end
  end
end
