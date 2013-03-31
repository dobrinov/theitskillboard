class AddUserIdAndUniversityIdToStudy < ActiveRecord::Migration
  def change
    add_column :studies, :user_id, :integer
    add_column :studies, :university_id, :integer
  end
end
