class CreateUniversityPrograms < ActiveRecord::Migration
  def change
    create_table :university_programs do |t|
      t.string :name

      t.timestamps
    end
  end
end
