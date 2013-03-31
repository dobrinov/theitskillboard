class CreateSkillCategories < ActiveRecord::Migration
  def change
    create_table :skill_categories do |t|
      t.string :name

      t.timestamps

      t.integer :parent_skill_category_id
    end
  end
end
