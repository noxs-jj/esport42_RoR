# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if !User.find_by(email: 'superRoot@esport.42.fr')
  user = User.new(
      :email                 => "superRoot@esport.42.fr",
      :password              => "XXXXXXXX", # Ofuscated in source code
      :password_confirmation => "XXXXXXXX" # Ofuscated in source code
  )
  user.admin = true
  user.save!
end
