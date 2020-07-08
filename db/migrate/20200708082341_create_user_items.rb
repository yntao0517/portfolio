class CreateUserItems < ActiveRecord::Migration[6.0]
  def change
    create_table :user_items do |t|
      t.references :user, index: true, null: false
      t.references :hospital_item, index: true, null: false
      t.timestamps
    end
  end
end
