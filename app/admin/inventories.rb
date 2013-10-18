ActiveAdmin.register Inventory do
form do |f|
	      f.inputs "Details" do
          f.input :factura_id, :as => :select, :collection => Hash[Factura.all.map{|u| [u.number, u.id]}]
          f.input :ref
          f.input :lot
          f.input :sn
		    end
		  f.buttons
      end

  show :title => "Detalles Inventarios" do |v|
      attributes_table do
        row :sn
        row :ref
        row :lot
        row "Factura" do
          v.factura.number
        end
      end
      if v.transacts.size > 0
        div do
          panel("Transacciones asociadas") do
            table_for(v.transacts.each) do
              column :id do |t|
                link_to(t.id,admin_transact_path(t))
              end
              column "Doctor" do |t|
                t.doctor.first+" "+t.doctor.last
              end
              column "Paciente" do |t|
                t.patient.first+" "+t.patient.last
              end
              column "Estado" do |t|
                t.estado_s 
              end
            end
          end
        end
      end
    end
  
end
