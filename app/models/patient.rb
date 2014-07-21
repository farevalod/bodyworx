class Patient < ActiveRecord::Base
  attr_accessible :first, :last
  has_many :transacts

  def name
	  return self.first+" "+self.last
  end
end
