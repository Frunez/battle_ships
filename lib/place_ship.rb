class Ship

  attr_reader :alt, :lat, :grid

  def initialize(altitude, latitude, grid)
    @alt = altitude
    @lat = latitude
    @grid = grid
  end

  def place
    if (alt >= 1 && lat >= 1) && (alt <= 10 && lat <= 10)
      self.ship
    else
      raise "Can't go outside the grid sailor unless you want the firing squad!"
    end
  end

  def ship
    if self.grid[alt][lat] != "0"
      self.grid[alt][lat] = "0"
    else
      raise "We already have a ship in that coordinate sailor"
    end
  end

end
