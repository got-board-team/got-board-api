class TerritorySerializer < ActiveModel::Serializer
  attributes :id, :slug, :path
  has_many :units

end
