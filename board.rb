# board for hangman game
class Board
  
  def initialize
    dictionary = File.open('dictionary.txt')
    @guess_word = dictionary.select { |word| word.length.between?(5, 12) }.sample
    @board = Array.new(@guess_word.length, '_')
    @count = 6
  end

end
