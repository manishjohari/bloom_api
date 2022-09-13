# == Schema Information
#
# Table name: lenses
#
#  id                :bigint           not null, primary key
#  colour            :string
#  description       :string
#  lens_type         :string
#  prescription_type :string
#  stock             :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class LenseSerializer < ActiveModel::Serializer
  attributes :id, :colour, :description, :prescription_type, :lens_type, :stock

  has_many :prices, serializer: PriceSerializer

end
