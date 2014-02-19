class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :level

      t.integer :user_id
      t.integer :skill_category_id

      t.timestamps
    end
  end
end