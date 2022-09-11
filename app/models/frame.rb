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
class Frame < ApplicationRecord
  enum :status, { active: 1, inactive: 2 }

  scope :active, -> { where(status: 1) }
  has_many :prices, as: :entity

  accepts_nested_attributes_for :prices

  def price_in(currency_code = 'usd')
    prices.find_by(currency_code: currency_code)&.price
  end
end
