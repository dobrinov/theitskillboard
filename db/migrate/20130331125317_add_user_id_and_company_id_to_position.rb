class AddUserIdAndCompanyIdToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :user_id, :integer
    add_column :positions, :company_id, :integer
  end
end
