class TicTacToe

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7],  # Middle column
  [2,5,8], # Right row
  [0,4,8], # Horizontal left to right
  [2,4,6]  # Horizontal right to left
]

  def initialize(board = Array.new(9, " "))
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    @user_input = user_input.to_i - 1
  end

  def move(index, current_player)
    @index = index
    @current_player = current_player
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    if @board[index] == 'X' || @board[index] == 'O'
      return false
    elsif index >=0 && index <=8
        return true
    end
  end

  def turn_count
    turn_count = 0
    @board.each do |move|
      if move != " "
        turn_count +=1
      end
    end
    return turn_count
  end

  def current_player
    x_moves = 0
    o_moves = 0
    @board.each do |move|
      if move == "X"
        x_moves += 1
      elsif move == "O"
        o_moves += 1
      end
    end
    if x_moves > o_moves
      return "O"
    else
      return "X"
    end
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.chomp)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
    end
  end

end
