class CellStatus < ActiveRecord::Base
  TERMINATED = 8
  WIN = 7
  FORFEIT_WIN = 6
  RUNNING = 5
  PENDING = 4
  CANCEL = 3
  DELETE = 2
  UNKNOW = 1

  def self.status_lisst
    CellStatus.all.map do |t|
      [t.name, t.id]
    end
  end
end
