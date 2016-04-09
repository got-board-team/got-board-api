class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :house, :user_id
  has_many :units
  has_many :order_tokens
  has_many :power_tokens
  has_many :house_cards

  def units
    serialize_without_territory(UnitSerializer, "unit")
  end

  def order_tokens
    serialize_without_territory(OrderTokenSerializer, "order_token")
  end

  def power_tokens
    serialize_without_territory(PowerTokenSerializer, "power_token")
  end

  def house_cards
    object.cards do |card|
      HouseCardSerializer.new(card).as_json["HouseCard"]
    end
  end

  def user_id
    object.user_id
  end

  private

  def serialize_without_territory(serializer, model_name)
    collection = model_name.pluralize
    object.send(collection).without_territory.map do |record|
      serializer.new(record).as_json[model_name]
    end
  end
end
