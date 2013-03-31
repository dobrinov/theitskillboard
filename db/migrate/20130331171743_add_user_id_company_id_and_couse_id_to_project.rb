class AddUserIdCompanyIdAndCouseIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :user_id, :integer
    add_column :projects, :company_id, :integer
    add_column :projects, :course_id, :integer
  end
end