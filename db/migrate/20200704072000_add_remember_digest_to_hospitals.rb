class AddRememberDigestToHospitals < ActiveRecord::Migration[6.0]
  def change
    add_column :hospitals, :remember_digest, :string
  end
end
