class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :price
      t.string :image_url
      t.string :item_code
      t.string :item_url
      
      t.timestamps
    end
  end
end
