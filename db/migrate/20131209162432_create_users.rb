class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :email
      t.string :password_digest
      t.string :name,    :default => 'Random'
      t.string :surname, :default => 'Developer'
      t.string :definition
      t.string :gender
      t.string :country
      t.string :city
      t.string :nationality
      t.date :birth_date
      t.attachment :avatar

      t.timestamps
    end
  end
end