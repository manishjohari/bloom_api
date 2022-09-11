class AddColumnAuthenticationTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :authentication_token, :string
    add_column :users, :authentication_token_updated_at, :datetime

    add_index :users, :authentication_token, unique: true
  end
end
