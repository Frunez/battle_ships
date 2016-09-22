class BattleShip
  attr_reader :grid
  def initialize
    @grid = [["=","=","=","=","=","=","=","=","=","=","=","="],
             ["=","^","^","^","^","^","^","^","^","^","^","="],
             ["=","^","^","^","^","^","^","^","^","^","^","="],
             ["=","^","^","^","^","^","^","^","^","^","^","="],
             ["=","^","^","^","^","^","^","^","^","^","^","="],
             ["=","^","^","^","^","^","^","^","^","^","^","="],
             ["=","^","^","^","^","^","^","^","^","^","^","="],
             ["=","^","^","^","^","^","^","^","^","^","^","="],
             ["=","^","^","^","^","^","^","^","^","^","^","="],
             ["=","^","^","^","^","^","^","^","^","^","^","="],
             ["=","^","^","^","^","^","^","^","^","^","^","="],
             ["=","=","=","=","=","=","=","=","=","=","=","="]]
  end

  def place(alt, lat)
    if (alt >= 1 && lat >= 1) && (alt <= 10 && lat <= 10)
      self.ship(alt, lat)
    else
      raise "Can't go outside the grid sailor unless you want the firing squad!"
    end
  end

  def ship(alt, lat)
    if self.grid[alt][lat] != "0"
      self.grid[alt][lat] = "0"
    else
      raise "We already have a ship in that coordinate sailor"
    end
  end

  def fire(alt, lat)
    if (alt >= 1 && lat >= 1) && (alt <= 10 && lat <= 10)
      self.target(alt, lat)
    else
      raise "There's nothing outside the grid, now fire that damned cannon properly!"
    end
  end

  def target(alt, lat)
    if self.grid[alt][lat] == "0"
      self.hit(alt, lat)
    else
      return "Missed, are you drunk sailor?"
    end
  end

  def hit(alt, lat)
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
