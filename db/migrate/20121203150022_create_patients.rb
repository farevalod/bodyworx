class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first
      t.string :last

      t.timestamps
    end
  end
end
