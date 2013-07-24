ActiveAdmin.register Patient do
 index do
      column :first, :label => "Nombre"
      column :last, :label => "Apellido"
      default_actions
    end
	form do |f|
	      f.inputs "Details" do
			f.input :first, :label => "Nombre"
			f.input :last, :label => "Apellido"
		  end
		f.buttons
	end
end 
