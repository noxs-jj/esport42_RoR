class CellStatus < ActiveRecord::Base
  TERMINATED = 9
  WIN = 8
  FORFEIT_WIN = 7
  WIN_OPPOSING_CHEAT = 6
  RUNNING = 5
  PENDING = 4
  CANCEL = 3
  DELETE = 2
  UNKNOW = 1

  def self.status_list
    CellStatus.all.map do |t|
      [t.name, t.id]
    end
  end
end
