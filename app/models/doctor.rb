class Doctor < ActiveRecord::Base
  belongs_to :clinic
  attr_accessible :dob, :first, :last
end
