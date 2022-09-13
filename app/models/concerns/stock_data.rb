module StockData

  extend ActiveSupport::Concern
  included do

    def reduce_stock
      update(stock: stock - 1)
    end
  end
end
