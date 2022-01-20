class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :created_at, :updated_at
end

class ProductRalationSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
end

class ProductDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :created_at, :updated_at
  has_many :relations, serializer: ProductRalationSerializer
end 