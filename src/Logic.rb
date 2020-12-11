require './Board.rb'
require './Square.rb'

class Logic
  attr_accessor :x_score, :o_score
  attr_reader :current_player

  def initialize
    @x_score = 0
    @o_score = 0
    @current_player = 'X'
  end

  def switch_player
    if @current_player == 'X'
      @current_player = 'O'
    else
      @current_player = 'X'
    end
  end

  def check_for_win(board)
    result = 0
    count = 0
    while result == 0 && count != 3
      result += does_row_contain_win(count, board)
      result += does_column_contain_win(count, board)
      result += does_diagonal_contain_win(count, board)
      count += 1
    end
    return result
  end

  def does_row_contain_win(row, board)
    result = 0 # 0 = no win, 1 = x win, -1 = o win
    if board.square_contains((row * 3) + 0) == board.square_contains((row * 3) + 1) &&
       board.square_contains((row * 3) + 1) == board.square_contains((row * 3 + 2))
      if board.square_contains((row * 3) + 0) == 'x'
        result = 1
      else
        result = -1
      end
    end
    return result
  end

  def does_column_contain_win(column, board)
    result = 0 # 0 = no win, 1 = x win, -1 = o win
    if board.square_contains((3 * 0) + column) == board.square_contains((3 * 1) + column) &&
       board.square_contains((3 * 1) + column) == board.square_contains((3 * 2) + column)
      if board.square_contains((3 * 0) + column) == 'x'
        result = 1
      else
        result = -1
      end
    end
    return result
  end

  def does_diagonal_contain_win(diagonal, board)
    result = 0
    if diagonal == 0
      if board.square_contains(4 * 0) == board.square_contains(4 * 1) &&
         board.square_contains(4 * 1) == board.square_contains(4 * 2)
        if board.square_contains(4 * 0) == 'x'
          result = 1
        else
          result = -1
        end
      end
    elsif diagonal == 1
      if board.square_contains(6 - (2 * 0)) == board.square_contains(6 - (2 * 1)) &&
         board.square_contains(6 - (2 * 1)) == board.square_contains(6 - (2 * 2))
        if board.square_contains(6 - (2 * 0)) == 'x'
          result = 1
        else
          result = -1
        end
      end
    end
    return result
  end
end
