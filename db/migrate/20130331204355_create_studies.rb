class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :program
      t.date :from_date
      t.date :to_date

      t.timestamps

      t.integer :user_id
      t.integer :university_id
    end
  end
end
