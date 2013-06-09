class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.string :position
      t.date :from_date
      t.date :to_date

      t.integer :profile_id
      t.integer :company_id

      t.timestamps
    end
  end
end