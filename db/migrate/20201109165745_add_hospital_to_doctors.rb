class AddHospitalToDoctors < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :hospitals_id

    add_reference :doctors, :hospital
  end
end
