class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(position, char)
    @board[position] = char
  end
  
   def position_taken?(index_i)
    ((@board[index_i] == "X") || (@board[index_i] == "O"))
  end
  
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count(board)
    counter = 0
    board.each do |space|
    if space == "X" || space == "O"
    counter += 1
    end
  end
    counter
  end
  
  def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
  end
    
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
  end 
  
    
    #full?
  def full?
   @board.all?{|occupied| occupied != " "}
  end

    #draw
  def draw?
    !(won?) && (full?)
    true  
  end

#over?
  def over?
    won? || full? || draw?
  end

  
end