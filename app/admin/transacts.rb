ActiveAdmin.register Transact do
 form do |f|
	      f.inputs "Details" do
          f.input :doctor_id, :as => :select, :collection => Hash[Doctor.all.map{|u| [u.first+" "+u.last, u.id]}]
          f.input :patient_id, :as => :select, :collection => Hash[Patient.all.map{|u| [u.first+" "+u.last, u.id]}]
          f.input :factura_venta_id, :as => :select, :collection => Hash[FacturaVenta.all.map{|u| [u.created_at,u.id]}]
          f.input :estado, :as => :select, :collection =>Hash["Pendiente" => 0,"Vendida" =>1,"Devuelta"=>2,"Perdida"=>3]
          f.inputs "Inventario" do
            f.has_many :inventories_transacts do |j|
              j.input :inventory_id, :as => :select, :collection => Hash[Inventory.all.map{|u| [u.sn, u.id]}]
            end
          end
        end
		f.buttons
	end 
end
