class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name,    { default: 'Your' }
      t.string :surname, { default: 'Name' }

      t.string :password_digest
      t.string :confirmation_code
      t.string :state

      t.string :gender
      t.date   :birthdate
      t.string :nationality
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
