class CreateInterestsProfiles < ActiveRecord::Migration
  def change
    create_table :interests_profiles do |t|
      t.integer :interest_id
      t.integer :profile_id
    end
  end
end