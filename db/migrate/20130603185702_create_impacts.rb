class CreateImpacts < ActiveRecord::Migration
  def change
    create_table :impacts do |t|
      t.date :from_date
      t.date :to_date
      t.text :title
      t.text :description

      t.integer :project_id
      t.integer :employment_id

      t.timestamps
    end
  end
end