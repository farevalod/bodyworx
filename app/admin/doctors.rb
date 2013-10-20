ActiveAdmin.register Doctor do
  index :title => "Doctores" do
      column "Nombre", :sortable => :first do  |d|
        d.first
      end
      column "Apellido", :sortable => :last do  |d|
        d.last
      end
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
  show :title => "Doctor" do |d|
  attributes_table do
      row "Nombre", :sortable => :first do  |d|
        d.first
      end
      row "Apellido", :sortable => :last do  |d|
        d.last
      end
      row "Fecha de nacimiento", :sortable => :dob do  |d|
        d.dob
      end
   if d.transacts
    div do
     panel("Transacciones Pendientes") do 
       table_for(d.transacts.each) do
        column :id do |t|
          link_to t.id, admin_transact_path(t)
        end
        column :nombre_paciente do |t|
          t.patient.first+" "+t.patient.last
        end
        column :estado_s
       end
     end
    end
  end
  end
  end
end
