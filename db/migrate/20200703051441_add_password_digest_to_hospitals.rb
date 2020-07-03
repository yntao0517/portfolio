class AddPasswordDigestToHospitals < ActiveRecord::Migration[6.0]
  def change
    add_column :hospitals, :password_digest, :string
  end
end
