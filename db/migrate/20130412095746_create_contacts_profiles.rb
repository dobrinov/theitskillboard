class CreateContactsProfiles < ActiveRecord::Migration
  def change
    create_table :contacts_profiles do |t|
      t.integer :contact_id
      t.integer :profile_id
    end
  end
end