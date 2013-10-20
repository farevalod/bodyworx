ActiveAdmin.register Patient do
  index :title => "Paciente" do
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
			f.input :first, :label => "Nombre"
			f.input :last, :label => "Apellido"
		  end
		f.buttons
	end
  show :title => "Datos Paciente" do |p| 
    attributes_table do
      row "Nombre Completo" do |p|
        p.first+" "+p.last
      end
   if p.transacts
    div do
     panel("Transacciones") do 
       table_for(p.transacts.each) do
        column :id do |t|
          link_to t.id, admin_transact_path(t)
        end
        column :nombre_doctor do |t|
          t.doctor.first+" "+t.doctor.last
        end
        column :estado_s
       end
     end
    end
  end
    end
  end  
end 
