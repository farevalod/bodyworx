class Factura < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :inventories
  attr_accessible :number
end
