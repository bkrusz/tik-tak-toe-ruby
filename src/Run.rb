require './Board.rb'
require './Logic.rb'

def game_loop(board, logic)
  board.display
  print 'space: '
  number = gets.chomp
  while number != 'q'
    number = number.to_i
    board.move(logic.current_player, number)
    board_status = logic.check_for_win(board)
    if board_status == 1
      p 'X wins'
      logic.x_score += 1
      board.clear
    elsif board_status == -1
      p 'O wins'
      logic.o_score += 1
      board.clear
    end
    print_score(logic)
    board.display
    logic.switch_player
    number = gets.chomp
  end
end

def print_score(logic)
  p 'X score: ' + logic.x_score.to_s + '   Y score: ' + logic.o_score.to_s
end

def run
  logic = Logic.new
  board = Board.new
  p 'q to quit'
  p 'X goes first'
  game_loop(board, logic)
end

run
