# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


# Creating an admin user if the user database is empty
if User.count == 0
  User.create!({:email => "handbook@applicake.com", :password => "INSERT_PASSWORD_HERE", :password_confirmation => "INSERT_PASSWORD_HERE" })
end
