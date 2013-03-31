class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name

      t.timestamps

      t.integer :user_id
      t.integer :company_id
      t.integer :course_id
    end
  end
end
