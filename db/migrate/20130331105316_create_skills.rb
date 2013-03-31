class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name

      t.timestamps

      t.integer :skill_category_id
    end
  end
end
