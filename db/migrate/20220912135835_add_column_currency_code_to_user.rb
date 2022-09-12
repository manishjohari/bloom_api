class AddColumnCurrencyCodeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :currency_code, :string, null: false, default: 'usd'
  end
end
