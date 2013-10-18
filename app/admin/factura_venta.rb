ActiveAdmin.register FacturaVenta do
  index do
    column :monto
    column :num
    default_actions
  end
	form do |f|
	  f.inputs "Details" do
			f.input :monto
      f.input :num
    end
		f.buttons
	end
end
