if User.find_by(email: 'superroot@esport.42.fr') == nil
  user = User.new(
    email: "superroot@esport.42.fr",
    username: "SuperRoot",
    first_name: "Super",
    last_name: "ROOT",
    password: "XXXXXXXX", # Ofuscated in source code
    password_confirmation: "XXXXXXXX" # Ofuscated in source code
  )
  user.admin = true
  puts "superroot@esport.42.fr created !"
  user.save!
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
	type = ParticipantType.new(name: "Referee")
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
  status = EventStatus.new(name: "Closed")
	status.save!
end

if Game.all.length < 7
  game = Game.new(name: "Unknow")
  game.save!
  game = Game.new(name: "League of Legends")
  game.save!
  game = Game.new(name: "Counter-Strike Global Offensive")
  game.save!
  game = Game.new(name: "HeartStone")
  game.save!
  game = Game.new(name: "Startcraft II")
  game.save!
  game = Game.new(name: "TrackMania 2")
  game.save!
  game = Game.new(name: "ShootMania")
  game.save!
end

if BracketStatus.all.length < 6
  status = BracketStatus.new(name: "Unknow")
  status.save!
  status = BracketStatus.new(name: "Deleted")
  status.save!
  status = BracketStatus.new(name: "Registation Open")
  status.save!
  status = BracketStatus.new(name: "Running")
  status.save!
  status = BracketStatus.new(name: "Closed")
  status.save!
  status = BracketStatus.new(name: "Terminated")
  status.save!
end

if CellStatus.all.length < 9
  status = CellStatus.new(name: "Unknow")
  status.save!
  status = CellStatus.new(name: "Deleted")
  status.save!
  status = CellStatus.new(name: "Canceled")
  status.save!
  status = CellStatus.new(name: "Pending")
  status.save!
  status = CellStatus.new(name: "Running")
  status.save!
  status = CellStatus.new(name: "Win by opposing cheating")
  status.save!
  status = CellStatus.new(name: "Forfeit Win")
  status.save!
  status = CellStatus.new(name: "Win")
  status.save!
  status = CellStatus.new(name: "Terminated")
  status.save!
end

if TournamentStatus.all.length < 7
  status = TournamentStatus.new(name: "Unknow")
  status.save!
  status = TournamentStatus.new(name: "Deleted")
  status.save!
  status = TournamentStatus.new(name: "Canceled")
  status.save!
  status = TournamentStatus.new(name: "Registation Open")
  status.save!
  status = TournamentStatus.new(name: "In progress")
  status.save!
  status = TournamentStatus.new(name: "Closed")
  status.save!
  status = TournamentStatus.new(name: "Terminated")
  status.save!
end

if User.find_by(email: 'test_asda@esport.42.fr') == nil
  user = User.new( email: "test_asda@esport.42.fr", username: "test_asda", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_asda@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_qpskj@esport.42.fr') == nil
  user = User.new( email: "test_qpskj@esport.42.fr", username: "test_qpskj", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_qpskj@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_6d5gadf@esport.42.fr') == nil
  user = User.new( email: "test_6d5gadf@esport.42.fr", username: "test_6d5gadf", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_6d5gadf@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_qazxcvb@esport.42.fr') == nil
  user = User.new( email: "test_qazxcvb@esport.42.fr", username: "test_qazxcvb", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_qazxcvb@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_awfwd@esport.42.fr') == nil
  user = User.new( email: "test_awfwd@esport.42.fr", username: "test_awfwd", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_awfwd@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_mknjbh@esport.42.fr') == nil
  user = User.new( email: "test_mknjbh@esport.42.fr", username: "test_mknjbh", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_mknjbh@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_tmxp@esport.42.fr') == nil
  user = User.new( email: "test_tmxp@esport.42.fr", username: "test_tmxp", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_tmxp@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_a6d4gas@esport.42.fr') == nil
  user = User.new( email: "test_a6d4gas@esport.42.fr", username: "test_a6d4gas", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_a6d4gas@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_1a2s3d4fg@esport.42.fr') == nil
  user = User.new( email: "test_1a2s3d4fg@esport.42.fr", username: "test_1a2s3d4fg", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_1a2s3d4fg@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_ddfgdszf@esport.42.fr') == nil
  user = User.new( email: "test_ddfgdszf@esport.42.fr", username: "test_ddfgdszf", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_ddfgdszf@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_shgdsf@esport.42.fr') == nil
  user = User.new( email: "test_shgdsf@esport.42.fr", username: "test_shgdsf", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_shgdsf@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_kujmnhgb@esport.42.fr') == nil
  user = User.new( email: "test_kujmnhgb@esport.42.fr", username: "test_kujmnhgb", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_kujmnhgb@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_xfgsz@esport.42.fr') == nil
  user = User.new( email: "test_xfgsz@esport.42.fr", username: "test_xfgsz", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_xfgsz@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_fhjdgdsf@esport.42.fr') == nil
  user = User.new( email: "test_fhjdgdsf@esport.42.fr", username: "test_fhjdgdsf", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_fhjdgdsf@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_dfgxdfzgs@esport.42.fr') == nil
  user = User.new( email: "test_dfgxdfzgs@esport.42.fr", username: "test_dfgxdfzgs", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_dfgxdfzgs@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_654zdfgzf@esport.42.fr') == nil
  user = User.new( email: "test_654zdfgzf@esport.42.fr", username: "test_654zdfgzf", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_654zdfgzf@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_fhjgegef@esport.42.fr') == nil
  user = User.new( email: "test_fhjgegef@esport.42.fr", username: "test_fhjgegef", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_fhjgegef@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_df56gfs@esport.42.fr') == nil
  user = User.new( email: "test_df56gfs@esport.42.fr", username: "test_df56gfs", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_df56gfs@esport.42.fr created !"
  user.save!
end
if User.find_by(email: 'test_0g0f2sdsf2@esport.42.fr') == nil
  user = User.new( email: "test_0g0f2sdsf2@esport.42.fr", username: "test_0g0f2sdsf2", password: "00000000", password_confirmation: "00000000" )
  user.admin = false
  puts "test_0g0f2sdsf2@esport.42.fr created !"
  user.save!
end

### for DEVELOPEMENT ONLY
if Rails.env == "development"
  if Event.all.length == 0
    event = Event.new(name: "event test 01",
      created_by: 1, status_id: EventStatus::REGISTRATION_OPENS,
      date: "2016-05-06 00:00:00" )
    event.save!
    event = Event.new(name: "event test 02",
      created_by: 1, status_id: EventStatus::PENDING,
      date: "2016-05-06 00:00:00")
    event.save!
    event = Event.new(name: "event test 03",
      created_by: 1, status_id: EventStatus::ANNOUNCED,
      date: "2016-05-06 00:00:00")
    event.save!
    event = Event.new(name: "event test 04 cenceled",
      created_by: 1, status_id: EventStatus::CANCELED,
      date: "2016-05-06 00:00:00")
    event.save!
    event = Event.new(name: "event test 05 closed",
      created_by: 1, status_id: EventStatus::CLOSE,
      date: "2016-05-06 00:00:00")
    event.save!
  end

  if Participant.where(event_id: 1, type_id: 3, status_id: 4).length != 16
    participant = Participant.new(user_id: 2, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 3, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 4, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 5, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 6, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 7, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 8, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 9, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 10, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id:11, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 12, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 13, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 14, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 15, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 16, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    participant = Participant.new(user_id: 17, event_id: 1, type_id: 3, status_id: 4)
    participant.save!
    puts "16 Participants created !"
  end

end
