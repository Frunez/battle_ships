require './lib/battle_ship'

describe BattleShip do
  let(:battle) {BattleShip.new}

  describe '#initialize' do
    it 'should initialize with a grid 10 blocks wide inc. borders (+2)' do
      expect(battle.grid.count).to eq 12
    end
    it 'should initialize with a grid 10 blocks high inc. borders (+2)' do
      expect(battle.grid.count).to eq 12
    end
  end

  describe '#place' do
    it 'should allow player to put in 2 numbers and place a ship' do
      expect(battle.place(5, 5)).to eq "0"
    end
    it 'should replace "^" on the grid with "0" to indicate it is a ship' do
      battle.place(10, 3)
      expect(battle.grid[10][3]).to eq "0"
    end
    it 'should not allow player to place a ship outside of the grid' do
      expect{battle.place(15, 2)}.to raise_error "Can't go outside the grid sailor unless you want the firing squad!"
    end
    it 'should not allow player to place a ship on the top border' do
      expect{battle.place(0, 4)}.to raise_error "Can't go outside the grid sailor unless you want the firing squad!"
    end
    it 'should not allow player to place a ship on the left border' do
      expect{battle.place(4, 0)}.to raise_error "Can't go outside the grid sailor unless you want the firing squad!"
    end
    it 'should not allow player to place a ship over another ship' do
      battle.place(1, 3)
      expect{battle.place(1, 3)}.to raise_error "We already have a ship in that coordinate sailor"
    end
  end

  describe '#fire' do
    before(:each) do
      battle.place(6, 9)
    end
    context 'firing a rocket at an opponent' do
      it 'hit the opponents ship!' do
        expect(battle.fire(6, 9)).to include "HIT! Good shot sailor!"
      end
      it 'missed the opponents ship!' do
        expect(battle.fire(3, 5)).to include "Missed, are you drunk sailor?"
      end
      it 'can not be fired outside the grid' do
        expect{battle.fire(30, 18)}.to raise_error "There's nothing outside the grid, now fire that damned cannon properly!"
      end
    end
  end

  describe '#victory!' do
    before(:each) do
      battle.place(7, 3)
    end
    context 'checks to see if all ships have been sunk' do
      it 'returns false if there are still ships on the grid' do
        expect(battle.victory!).to eq ""
      end
      it 'returns true if all ships have been sunk' do
        battle.fire(7, 3)
        expect(battle.victory!).to eq " Well done, sailor, we won! lets grab some rum!"
      end
    end
    it 'tells the player when they have won, aka sunk all ships' do
      # battle.grid.each do |line| puts line.to_s + "\n" end
      expect(battle.fire(7, 3)).to include 'Well done, sailor, we won! lets grab some rum!'
    end
    it 'tells the player when they have lost, aka no more ships' do

    end
  end
end
