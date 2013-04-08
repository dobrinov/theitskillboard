class AddAttachmentProfilePictureToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :profile_picture
    end
  end

  def self.down
    drop_attached_file :profiles, :profile_picture
  end
end
