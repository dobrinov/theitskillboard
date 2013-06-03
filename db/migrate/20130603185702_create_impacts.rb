class CreateImpacts < ActiveRecord::Migration
  def change
    create_table :impacts do |t|
      t.date :from
      t.date :to
      t.text :description

      t.timestamps
    end
  end
end