class RemoveColumnPriceFromFrames < ActiveRecord::Migration[7.0]
  def change
    remove_column :frames, :price
  end
end
