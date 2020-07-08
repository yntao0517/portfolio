class CreateHospitalItems < ActiveRecord::Migration[6.0]
  def change
    create_table :hospital_items do |t|
      t.references :hospital, index: true, null: false
      t.references :item, index: true, null: false
      t.timestamps
    end
  end
end
