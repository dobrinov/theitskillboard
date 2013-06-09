class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :website

      t.timestamps

      t.integer :company_id
      t.integer :course_id
    end
  end
end