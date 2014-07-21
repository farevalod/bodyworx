ActiveAdmin.register Clinic, :as => "Clinicas"do
 index :title => "Clinicas"  do
    column "Clinica", :sortable => :name do  |c|
      c.name
    end
    column "Direccion", :sortable => :address do |a|
      a.address
      end
    default_actions
  end
end
