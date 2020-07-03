class AddIndexToHospitalsEmail < ActiveRecord::Migration[6.0]
  def change
    add_index :hospitals, :email, unique: true
  end
end
