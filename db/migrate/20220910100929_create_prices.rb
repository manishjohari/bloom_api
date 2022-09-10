class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.float :price
      t.string :currency_code, index: true
      t.references :entity, polymorphic: true

      t.timestamps
    end
  end
end
