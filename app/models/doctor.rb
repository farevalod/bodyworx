class Doctor < ActiveRecord::Base
  belongs_to :clinic
  has_many :transacts
  attr_accessible :dob, :first, :last, :clinic_id

  def self.no_pendientes
    ts = Transact.where("estado == 2")
    d_id_ts = Set.new
    ts.each do |t|
      d_id_ts.add(t.doctor.id)
    end
    ds = Set.new
    Doctor.all.each do |d|
      ds.add(d.id)
    end
    return Doctor.where("id IN (?)",ds - d_id_ts)
  end

  def name
	  return self.first+" "+self.last
  end
end
