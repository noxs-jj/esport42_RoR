if User.find_by(email: 'superroot@esport.42.fr') == nil
  user = User.new(
    :email                 => "superroot@esport.42.fr",
    :password              => "XXXXXXXX", # Ofuscated in source code
    :password_confirmation => "XXXXXXXX" # Ofuscated in source code
  )
  user.admin = true
  puts "superroot@esport.42.fr created !"
  user.save!
end

if User.find_by(email: 'testuser@esport.42.fr') == nil
  user = User.new(
    :email                 => "testuser@esport.42.fr",
    :password              => "testuser", # Ofuscated in source code
    :password_confirmation => "testuser" # Ofuscated in source code
  )
  user.admin = false
  puts "testuser@esport.42.fr created !"
  user.save!
end

if Event.all.length == 0
  event = Event.new(
    name: "event test 01",
    created_by: 1,
    date: "2016-05-06 00:00:00"
  )
  event.save!
end

if ParticipantStatus.all.length < 8
	status = ParticipantStatus.new(name: "Unknow")
	status.save!
	status = ParticipantStatus.new(name: "Pending")
	status.save!
	status = ParticipantStatus.new(name: "Payment Pending")
	status.save!
	status = ParticipantStatus.new(name: "Validated")
	status.save!
	status = ParticipantStatus.new(name: "Refused")
	status.save!
	status = ParticipantStatus.new(name: "Payment Refused")
	status.save!
	status = ParticipantStatus.new(name: "Checking")
	status.save!
	status = ParticipantStatus.new(name: "Administrative check")
	status.save!
end

if ParticipantType.all.length < 6
	type = ParticipantType.new(name: "Unknow")
	type.save!
	type = ParticipantType.new(name: "Visitor")
	type.save!
	type = ParticipantType.new(name: "Concurrent")
	type.save!
	type = ParticipantType.new(name: "referee")
	type.save!
	type = ParticipantType.new(name: "Admin")
	type.save!
	type = ParticipantType.new(name: "Organizer")
	type.save!
end

if EventStatus.all.length < 7
  status = EventStatus.new(name: "Unknow")
	status.save!
  status = EventStatus.new(name: "Announced")
	status.save!
  status = EventStatus.new(name: "Pending")
	status.save!
  status = EventStatus.new(name: "Registration opens")
	status.save!
  status = EventStatus.new(name: "In progress")
	status.save!
  status = EventStatus.new(name: "Canceled")
	status.save!
  status = EventStatus.new(name: "Close")
	status.save!
end
