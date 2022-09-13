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
class Lense < ApplicationRecord
  include PriceData
  include StockData

  LanseType = %w(classic blue_light transition)
  PrescriptionType = %w(fashion single_vision varifocals)

  validates :lens_type, inclusion:{ in: LanseType, message: "must be one of #{LanseType.join(', ')}"}
  validates :prescription_type, inclusion:{ in: PrescriptionType, message: "must be one of #{PrescriptionType.join(', ')}" }

end
