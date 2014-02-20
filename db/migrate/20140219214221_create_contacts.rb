class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :ctype
      t.string :address

      t.integer :user_id

      t.timestamps
    end
  end
end
