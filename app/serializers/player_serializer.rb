class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :house
  has_many :units
  has_many :order_tokens

  def units
    object.units.without_territory.map do |unit|
      UnitSerializer.new(unit).as_json["unit"]
    end
  end

  def order_tokens
    object.order_tokens.without_territory.map do |order_token|
      OrderTokenSerializer.new(order_token).as_json["order_token"]
    end
  end
end
