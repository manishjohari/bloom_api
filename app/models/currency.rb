# == Schema Information
#
# Table name: currencies
#
#  id            :bigint           not null
#  currency_code :string           not null, primary key
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_currencies_on_currency_code  (currency_code)
#
class Currency < ApplicationRecord
  self.primary_key = 'currency_code'
  validates :name, presence: true, uniqueness: true

  before_save do
    self.currency_code = name.downcase
  end
end
