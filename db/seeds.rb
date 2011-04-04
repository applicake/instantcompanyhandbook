# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)



# loading admin credentials from the config/passwords.yml file
administrator = YAML.load_file("#{Rails.root}/config/passwords.yml")['administrator'].symbolize_keys

# dumping the user database and creating a single admin user
User.delete_all
User.create!(administrator)
