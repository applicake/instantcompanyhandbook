# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


# dumping the user database and creating a single admin user
User.delete_all
User.create!({:email => "companyhandbook@applicake.com", :password => "INSERT_PASSWORD_HERE", :password_confirmation => "INSERT_PASSWORD_HERE" })
