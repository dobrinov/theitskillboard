class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string  :name
      t.date    :from_date
      t.date    :to_date
      t.integer :course_id

      t.timestamps
    end
  end
end
