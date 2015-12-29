class CreateApiTokens < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :api_tokens do |t|
      t.uuid :token

      t.timestamps null: false
    end
    add_index :api_tokens, :token
  end
end
