class RenameColumnColorInLenses < ActiveRecord::Migration[7.0]
  def change
    rename_column :lenses, :color, :colour
  end
end
