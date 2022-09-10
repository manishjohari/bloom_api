class CreateFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :frames do |t|
      t.string :name
      t.text :description
      t.integer :status,  default: 1 # active by default
      t.integer :stock,   default: 0  # default stock is zero
      t.float :price

      t.timestamps
    end
  end
end
