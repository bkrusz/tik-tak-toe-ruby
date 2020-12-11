require './Board.rb'
require './WinLogic.rb'

def game_loop(board, logic)
  board.display
  p 'x or o: '
  name = gets.chomp
  while name != 'q'
    p 'space: '
    number = gets.chomp.to_i
    board.move(name, number)
    board_status = logic.check_for_win(board)
    if board_status == 1
      p 'X wins'
      logic.x_score += 1
      board.clear
    elsif board_status == -1
      p 'O wins'
      logic.x_score += 1
      board.clear
    end
    print_score(logic)
    board.display
    p 'x or o: '
    name = gets.chomp
  end
end

def print_score(logic)
  p 'X score: ' + logic.x_score.to_s + '   Y score: ' + logic.o_score.to_s
end

def run
  logic = WinLogic.new
  board = Board.new
  board_status = 0
  game_loop(board, logic)
end

run
