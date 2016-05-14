if User.find_by(email: 'superRoot@esport.42.fr') != nil
  user = User.new(
      :email                 => "superRoot@esport.42.fr",
      :password              => "XXXXXXXX", # Ofuscated in source code
      :password_confirmation => "XXXXXXXX" # Ofuscated in source code
  )
  user.admin = true
  user.save!
end

if Event.all.length == 0
  event = Event.new(
    name: "event test 01",
    created_by: 1,
    date: 1364046539
  )
  puts event
  event.save!
end
