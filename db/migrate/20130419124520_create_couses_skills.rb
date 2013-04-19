class CreateCousesSkills < ActiveRecord::Migration
  def change
    create_table :courses_skills do |t|
      t.integer :course_id
      t.integer :skill_id
    end
  end
end
