class CreateImpacts < ActiveRecord::Migration
  def change
    create_table :impacts do |t|
      t.date :from
      t.date :to
      t.text :title
      t.text :description

      t.integer :project_id
      t.integer :company_id

      t.timestamps
    end
  end
end