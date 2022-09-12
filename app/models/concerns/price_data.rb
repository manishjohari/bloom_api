module PriceData

  extend ActiveSupport::Concern
  included do

    has_many :prices, as: :entity

    accepts_nested_attributes_for :prices

    def price_in(currency_code = 'usd')
      prices.find_by(currency_code: currency_code)&.price
    end
  end
end
