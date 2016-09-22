class Fire

  attr_reader :alt, :lat, :grid

  def initialize(altitude, latitude, grid)
    @alt = altitude
    @lat = latitude
    @grid = grid
  end

  def fire
    if (alt >= 1 && lat >= 1) && (alt <= 10 && lat <= 10)
      self.target
    else
      raise "There's nothing outside the grid, now fire that damned cannon properly!"
    end
  end

  def target
    if self.grid[alt][lat] == "0"
      self.hit
    else
      return "Missed, are you drunk sailor?"
    end
  end

  def hit
    self.grid[alt][lat] = "X"
    "HIT! Good shot sailor!" + self.victory!
  end


  def victory!
    hit_string = "HIT! Good shot sailor!"
    if self.grid.flatten.include? "0"
      @victory = ""
    else
      @victory = " Well done, sailor, we won! lets grab some rum!"
    end
  end
end
