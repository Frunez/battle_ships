require_relative 'grid'
require_relative 'place_ship'
require_relative 'fire_rocket'

class BattleShip

  attr_reader :grid

  def initialize
    @grid = Grid.new.array
  end

  def place(alt, lat)
    @place = Ship.new(alt, lat, grid).place
  end

  def fire(alt, lat)
    @fire = Fire.new(alt, lat, grid).fire
  end
end
