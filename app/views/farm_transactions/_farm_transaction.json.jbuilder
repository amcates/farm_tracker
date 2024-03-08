json.extract! farm_transaction, :id, :transaction_type, :item_name, :description, :amount, :happened_on, :created_at, :updated_at
json.url farm_transaction_url(farm_transaction, format: :json)
