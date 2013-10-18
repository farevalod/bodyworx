ActiveAdmin.register Doctor do
  index do
      column :first, :label => "Nombre"
      column :last, :label => "Apellido"
      default_actions
    end
	form do |f|
    f.inputs "Details" do
			f.input :clinic
			f. input :first, :label => "Nombre"
			f.input :last, :label => "Apellido"
			f.input :dob, :label => "Fecha de nacimiento", :start_year => 1940, :end_year => 1990
    end
		f.buttons
	end
  show do |d|
  attributes_table do
    row :first
    row :last
    row :dob
    div do
   if Transact.where(:doctor_id => d.id).where(:estado =>  0)
     panel("Transacciones Pendientes") do 
       table_for(Transact.where(:doctor_id => d.id).where(:estado =>  0).each) do
        column :id do |t|
          link_to t.id, admin_transact_path(t)
        end
        column :nombre do |t|
          t.doctor.first+" "+t.doctor.last
        end
        column :estado
       end
     end
    end
  end
  end
  end
end
