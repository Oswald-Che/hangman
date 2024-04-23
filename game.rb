require_relative 'board'
class Game

  def initialize
    @board = Board.new
  end

  def play
    while @board.count > 0 do
      @board.save
      puts 'Please guess the letter'
      guess = input
      if @board.check_guess(guess)
        break if @board.game_end

        next
      end
      @board.count -= 1
    end
  end

  def input
    guess = gets.chomp
  end
end

Game.new.play