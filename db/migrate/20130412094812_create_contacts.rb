class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contact_type
      t.string :address

      t.timestamps
    end
  end
end
