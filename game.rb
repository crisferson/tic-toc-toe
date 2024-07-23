require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :players, :current_player

  def initialize
    @board = Board.new
    @players = [Player.new('Player 1', 'X'), Player.new('Player 2', 'O')]
    @current_player = @players[0]
  end

  def play
    loop do
      board.display
      puts "#{current_player.name}'s turn (#{current_player.symbol})."
      make_move
      if board.winning_combination?(current_player.symbol)
        board.display
        puts "#{current_player.name} wins!"
        break
      elsif board.full?
        board.display
        puts "It's a tie!"
        break
      else
        switch_turns
      end
    end
  end

  private

  def switch_turns
    @current_player = (current_player == players[0]) ? players[1] : players[0]
  end

  def make_move
    move = nil
    until move && board.update(move, current_player.symbol)
      puts 'Enter your move (1-9):'
      move = gets.chomp.to_i - 1
    end
  end
end