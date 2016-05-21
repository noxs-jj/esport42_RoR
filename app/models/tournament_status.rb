class TournamentStatus < ActiveRecord::Base
  TERMINATED = 7
  CLOSED = 6
  IN_PROGRESS = 5
  REGISTRATION_OPENS = 4
  CANCELED = 3
  DELETED = 2
  UNKNOW = 1

  def self.list_status
    TournamentStatus.all.map do |t|
      [t.name, t.id]
    end
  end
end
