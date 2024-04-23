
class Game

  def initialize
    @board = Board.new
  end

  def play
    while @board.count > 0 do
      @board.save
      puts "Please guess the letter"
      guess = input
      next if board.check_guess(guess)
      board.count -= 1
    end
  end

  def input
    guess = gets.chomp
  end
end
