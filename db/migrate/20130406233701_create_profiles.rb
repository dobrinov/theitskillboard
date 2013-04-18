class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string     :name
      t.string     :surname
      t.string     :country
      t.string     :city
      t.string     :nationality
      t.date       :birth_date

      t.attachment :profile_picture

      t.integer    :user_id

      t.timestamps
    end
  end
end
