class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.string :position
      t.date :from_date
      t.date :to_date

      t.timestamps

      t.integer :profile_id
      t.integer :company_id
    end
  end
end
