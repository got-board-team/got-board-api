class GarrisonSerializer < ActiveModel::Serializer
  attributes :id, :name, :territory, :x, :y
end
