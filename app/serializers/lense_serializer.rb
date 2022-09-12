class LenseSerializer < ActiveModel::Serializer
  attributes :id, :color, :description, :prescription_type, :lens_type, :stock

  has_many :prices, serializer: PriceSerializer

end