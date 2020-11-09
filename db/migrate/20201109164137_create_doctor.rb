class CreateDoctor < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.string :university

      t.timestamps
    end

    add_reference :doctors, :hospitals
  end
end
