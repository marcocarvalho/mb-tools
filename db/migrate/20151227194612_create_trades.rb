class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.timestamp :date
      t.float :price
      t.float :amount
      t.integer :tid
      t.string :kind

      t.timestamps null: false
    end
  end
end
