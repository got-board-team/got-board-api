class BoardSerializer < ActiveModel::Serializer
  attributes :id
  has_many :territories
end
