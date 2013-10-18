ActiveAdmin.register Transact do
 form do |f|
	      f.inputs "Details" do
          f.input :doctor_id, :as => :select, :collection => Hash[Doctor.all.map{|u| [u.first+" "+u.last, u.id]}]
          f.input :patient_id, :as => :select, :collection => Hash[Patient.all.map{|u| [u.first+" "+u.last, u.id]}]
          f.input :factura_venta_id, :as => :select, :collection => Hash[FacturaVenta.all.map{|u| [u.num, u.id]}]
          f.input :estado, :as => :select, :collection =>Hash["Pendiente" => 0,"Vendida" =>1,"Devuelta"=>2,"Perdida"=>3]
          f.inputs "Inventario" do
            f.has_many :inventories_transacts do |j|
              t = Transact.find_by_id(params[:id])
              if t
                j.input :inventory_id, :as => :select, :collection => Hash[(Inventory.free_inventory+t.inventories).map{|u| [u.sn, u.id]}]
              else
                j.input :inventory_id, :as => :select, :collection => Hash[(Inventory.free_inventory).map{|u| [u.sn, u.id]}]
              end
            end
          end
        end
		f.buttons
	end 
  index do |f|
    column 'id' do |t|
    link_to t.id, admin_transact_path(t)
    end
    column :estado_s
    column 'Doctor' do |t|
      t.doctor.first+' '+t.doctor.last
    end
    column 'Paciente' do |t|
      t.patient.first+' '+t.patient.last
      end
      default_actions
  end

  show :title => "Detalles Transaccion" do |v|
      attributes_table do
        row "Doctor" do
          v.doctor.first+" "+v.doctor.last
          link_to v.doctor.first+' '+v.doctor.last, admin_doctor_path(v.doctor)
        end
        row "Paciente" do
          v.patient.first+" "+v.patient.last
          link_to v.patient.first+' '+v.patient.last, admin_patient_path(v.patient)
        end
        row "Factura Venta" do
          if v.factura_venta
            link_to v.factura_venta.num, admin_factura_ventum_path(v.factura_venta)
          end
        end
        row "Estado" do
          v.estado_s
        end
      end
      if v.inventories.size > 0
        div do
          panel("Productos asociado") do
            table_for(v.inventories.each) do
              column :sn do |i|
                link_to(i.sn,admin_inventory_path(i))
              end
            end
          end
        end
      end
    end

         
end
