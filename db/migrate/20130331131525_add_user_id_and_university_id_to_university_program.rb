class AddUserIdAndUniversityIdToUniversityProgram < ActiveRecord::Migration
  def change
    add_column :university_programs, :user_id, :integer
    add_column :university_programs, :university_id, :integer
  end
end
