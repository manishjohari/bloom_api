class FrameSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status

  has_many :prices, serializer: PriceSerializer

end
