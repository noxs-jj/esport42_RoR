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
