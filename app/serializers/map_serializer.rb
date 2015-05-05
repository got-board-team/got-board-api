class MapSerializer < ActiveModel::Serializer
  attributes :id, :territories
  has_many :map_areas
end
