class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.integer :hospital_id
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
