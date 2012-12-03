ActiveAdmin.register Doctor do
	form do |f|
	      f.inputs "Details" do
			f.input :clinic
			f.input :first, :label => "Nombre"
			f.input :last, :label => "Apellido"
			f.input :dob, :label => "Fecha de nacimiento", :start_year => 1940, :end_year => 1990
		  end
		f.buttons
	end
end
