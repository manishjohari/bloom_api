# == Schema Information
#
# Table name: prices
#
#  id            :bigint           not null, primary key
#  currency_code :string
#  entity_type   :string
#  price         :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  entity_id     :bigint
#
# Indexes
#
#  index_prices_on_currency_code  (currency_code)
#  index_prices_on_entity         (entity_type,entity_id)
#
class PriceSerializer < ActiveModel::Serializer
  attributes :price, :currency_code
end
