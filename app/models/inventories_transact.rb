class InventoriesTransact < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :transact

  attr_accessible :inventory_id, :transact_id
  accepts_nested_attributes_for :transact
end
