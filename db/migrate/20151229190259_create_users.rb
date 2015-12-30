class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps null: false
    end

    add_index :users, :email, unique: true

    add_column :api_tokens, :user_id, :integer
    add_column :api_tokens, :valid_until, :timestamp
    add_index :api_tokens, :user_id
  end
end
