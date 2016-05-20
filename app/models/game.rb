class Game < ActiveRecord::Base
  def self.list_game
    Game.all.map do |t|
      [t.name, t.id]
    end
  end
end
