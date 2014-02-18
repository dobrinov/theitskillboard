class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :at
      t.date :from
      t.date :to
      t.string :website
      t.boolean :ongoing
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end