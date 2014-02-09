class CreateSkillCategory < ActiveRecord::Migration
  def change
    create_table :skill_categories do |t|
      t.string :name
      t.integer :user_id
      t.integer :parent_skill_category_id

      t.timestamps
    end
  end
end