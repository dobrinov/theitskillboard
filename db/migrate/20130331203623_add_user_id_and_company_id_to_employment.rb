class AddUserIdAndCompanyIdToEmployment < ActiveRecord::Migration
  def change
    add_column :employments, :user_id, :integer
    add_column :employments, :company_id, :integer
  end
end
