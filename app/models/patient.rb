class Patient < ActiveRecord::Base
  attr_accessible :first, :last
  has_many :transacts
end
