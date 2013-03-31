class AddParentSkillCategoryIdToSkillcategory < ActiveRecord::Migration
  def change
    add_column :skill_categories, :parent_skill_category_id, :integer
  end
end
