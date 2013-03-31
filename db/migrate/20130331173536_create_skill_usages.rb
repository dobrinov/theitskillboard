class CreateSkillUsages < ActiveRecord::Migration
  def change
    create_table :skill_usages do |t|
      t.integer :skill_id
      t.integer :project_id
      t.integer :course_id

      t.timestamps
    end
  end
end
