ActiveAdmin.register Transact do
 form do |f|
	      f.inputs "Details" do
          f.input :doctor_id, :as => :select, :collection => Hash[Doctor.all.map{|u| [u.first+" "+u.last, u.id]}]
          f.input :patient_id, :as => :select, :collection => Hash[Patient.all.map{|u| [u.first+" "+u.last, u.id]}]
          f.input :factura_venta_id, :as => :select, :collection => Hash[FacturaVenta.all.map{|u| [u.created_at,u.id]}]
          f.input :estado, :as => :select, :collection =>Hash["Pendiente" => 0,"Vendida" =>1,"Devuelta"=>2,"Perdida"=>3]
          f.collection_select :inventory_ids,Inventory.all, :id, :sn,{},{:multiple => true}
		  end
		f.buttons
	end 
end
