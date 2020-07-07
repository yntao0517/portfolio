class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :email
      t.string :address
      t.integer :phone_number
      t.string :representative

      t.timestamps
    end
  end
end
