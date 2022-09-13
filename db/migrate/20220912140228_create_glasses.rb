class CreateGlasses < ActiveRecord::Migration[7.0]
  def change
    create_table :glasses do |t|
      t.references :frame
      t.references :lense
      t.references :user

      t.timestamps
    end
  end
end
