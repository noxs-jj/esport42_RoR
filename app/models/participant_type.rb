class ParticipantType < ActiveRecord::Base
  ORGANISER = 6
  ADMIN = 5
  REFEREE = 4
  CONCURRENT = 3
  VISITOR = 2
  UNKOWN = 1

  def self.list_type
    ParticipantType.all.map do |t|
      [t.name, t.id]
    end
  end
end
