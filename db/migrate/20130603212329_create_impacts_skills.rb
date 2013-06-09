class CreateImpactsSkills < ActiveRecord::Migration
  def change
    create_table :impacts_skills do |t|
      t.integer :impact_id
      t.integer :skill_id
    end
  end
end