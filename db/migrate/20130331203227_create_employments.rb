class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|

      t.timestamps
    end
  end
end
