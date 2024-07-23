class Board
    WINNING_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],  # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8],  # Columns
      [0, 4, 8], [2, 4, 6]              # Diagonals
    ]
  
    def initialize
      @cells = Array.new(9, " ")
    end
  
    def display
      puts <<-BOARD
       #{@cells[0]} | #{@cells[1]} | #{@cells[2]}
      ---+---+---
       #{@cells[3]} | #{@cells[4]} | #{@cells[5]}
      ---+---+---
       #{@cells[6]} | #{@cells[7]} | #{@cells[8]}
      BOARD
    end
  
    def update(position, symbol)
      if @cells[position] == " "
        @cells[position] = symbol
        true
      else
        puts "Cell already taken. Choose another one."
        false
      end
    end
  
    def full?
      !@cells.include?(" ")
    end
  
    def winning_combination?(symbol)
      WINNING_COMBINATIONS.any? do |combination|
        combination.all? { |index| @cells[index] == symbol }
      end
    end
  end
