class AddAnimalToFarmTransaction < ActiveRecord::Migration[7.1]
  def change
    add_column :farm_transactions, :animal, :string, after: :transaction_type
  end
end
