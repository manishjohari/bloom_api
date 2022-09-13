class CreateLenses < ActiveRecord::Migration[7.0]
  def change
    create_table :lenses do |t|
      t.string :color
      t.string :description
      t.string :prescription_type
      t.string :lens_type
      t.integer :stock,   default: 0

      t.timestamps
    end
  end
end
