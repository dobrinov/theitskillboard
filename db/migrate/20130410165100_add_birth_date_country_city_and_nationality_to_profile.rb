class AddBirthDateCountryCityAndNationalityToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :birth_date, :date
    add_column :profiles, :country, :string
    add_column :profiles, :city, :string
    add_column :profiles, :nationality, :string
  end
end
