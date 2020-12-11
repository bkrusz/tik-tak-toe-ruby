require './Square.rb'

class Board
  def initialize
    @square_array = Array.new(9)
    for i in 0..8
      @square_array[i] = Square.new(i.to_s)
    end
  end

  def move(player, location)
    if(@square_array[location].is_empty)
      @square_array[location].player = player.upcase
      @square_array[location].is_empty = false
    else
      p 'Cannot move there. Space already occupied'
    end
  end

  def display
    for i in 0..8
      if i % 3 == 2
        print @square_array[i].player + "\n"
        print '---------' + "\n"
      else
        print @square_array[i].player + ' | '
      end
    end
  end

  def square_contains(square)
    @square_array[square].player
  end

  def clear
    for i in 0..8
      @square_array[i].player = i.to_s
    end
  end
end
