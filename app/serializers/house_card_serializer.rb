class HouseCardSerializer < ActiveModel::Serializer
  attributes :id, :name, :discarted_at, :x, :y
end
