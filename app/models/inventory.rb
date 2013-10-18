class Inventory < ActiveRecord::Base
  belongs_to :factura
  attr_accessible :lot, :ref, :sn, :factura_id 
  has_many :inventories_transacts, inverse_of: :transact
  has_many :transacts, :through => :inventories_transacts

  def self.free_inventory
    all_inv = Inventory.all
    i_ids = Set.new
    all_inv.each do |i|
      i_ids.add(i.id)
    end
    trans = Transact.where("estado != 2")
    t_ids = Set.new
    trans.each do |t|
      t.inventories.each do |i|
        t_ids.add(i.id)
      end
    end
    return Inventory.where("id IN (?)",(i_ids - t_ids))
  end
end
