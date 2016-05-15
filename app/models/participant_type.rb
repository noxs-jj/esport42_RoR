class ParticipantType < ActiveRecord::Base
  ORGANISER = 6
  ADMIN = 5
  REFEREE = 4
  CONCURRENT = 3
  VISITOR = 2
  UNKOWN = 1
end
