class BracketStatus < ActiveRecord::Base
  TERMINATED = 6
  CLOSED = 5
  RUNNING = 4
  REGISTRATION_OPENS = 3
  DELETE = 2
  UNKNOW = 1

  def self.status_lisst
    BracketStatus.all.map do |t|
      [t.name, t.id]
    end
  end
end
