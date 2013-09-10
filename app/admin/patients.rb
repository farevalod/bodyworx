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
  show do |p| 
    attributes_table do
      row "Nombre Completo" do |p|
        p.first+" "+p.last
      end
    end
  end  
end 
