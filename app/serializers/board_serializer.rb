class BoardSerializer < ActiveModel::Serializer
  attributes :id
  has_one :map
end
