class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      t.integer :sender_id
      t.integer :receiver_id

      t.string :sender_name
      t.string :sender_email

      t.string :subject
      t.string :body

      t.timestamps
    end
  end
end
