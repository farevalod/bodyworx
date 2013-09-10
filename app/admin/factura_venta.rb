ActiveAdmin.register FacturaVenta do
  index do
    column :monto
    default_actions
  end
	form do |f|
	  f.inputs "Details" do
			f.input :monto
      f.input :transact_id, :as => :select, :collection => Hash[Transact.all.map{|t| [t.patient.first+" "+t.patient.last,t.id]}]
    end
		f.buttons
	end
end
