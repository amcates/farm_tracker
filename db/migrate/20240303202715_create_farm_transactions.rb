class CreateFarmTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :farm_transactions do |t|
      t.string :transaction_type
      t.string :item_name
      t.text :description
      t.float :amount
      t.date :happened_on

      t.timestamps
    end
  end
end
