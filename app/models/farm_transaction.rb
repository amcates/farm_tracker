class FarmTransaction < ApplicationRecord
  validates :transaction_type, :item_name, :amount, :happened_on, presence: true
  validates :amount, numericality: true

  TRANSACTION_TYPES = ['Purchase', 'Sale']
  ANIMALS = ['Chicken', 'Pig', 'Rabbit']
  ITEMS = ['Eggs', 'Feed', 'Fencing', 'Misc']
end
