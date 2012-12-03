class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :first
      t.string :last
      t.references :clinic
      t.date :dob

      t.timestamps
    end
    add_index :doctors, :clinic_id
  end
end
