# == Schema Information
#
# Table name: frames
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  price       :float
#  status      :integer          default("active")
#  stock       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class FrameSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status

  has_many :prices, serializer: PriceSerializer

end
