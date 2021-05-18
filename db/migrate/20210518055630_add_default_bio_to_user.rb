class AddDefaultBioToUser < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:users, :bio, from: nil, to: "Enter Bio Here")
    change_column_default(:users, :first_name, from: nil, to: "Enter You First Name Here")
    change_column_default(:users, :last_name, from: nil, to: "Enter You Last Name Here")
  end
end
