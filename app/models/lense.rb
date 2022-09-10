# == Schema Information
#
# Table name: lenses
#
#  id                :bigint           not null, primary key
#  color             :string
#  description       :string
#  lens_type         :string
#  prescription_type :string
#  stock             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Lense < ApplicationRecord
	has_many :prices, as: :entity

  def price_in(currency_code = 'usd')
    prices.find_by(currency_code: currency_code)&.price
  end	
end
