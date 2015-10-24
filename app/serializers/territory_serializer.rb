class TerritorySerializer < ActiveModel::Serializer
  attributes :id, :slug, :path
  has_many :units
  has_many :order_tokens
end
