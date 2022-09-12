# == Schema Information
#
# Table name: lenses
#
#  id                :bigint           not null, primary key
#  colour            :string
#  description       :string
#  lens_type         :string
#  prescription_type :string
#  stock             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Lense < ApplicationRecord
  include PriceData

end
