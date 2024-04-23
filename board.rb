# board for hangman game
class Board
  
  def initialize
    dictionary = File.open('dictionary.txt')
    @guess_word = dictionary.select { |word| word.length.between?(5, 12) }.sample
    @board = Array.new(@guess_word.length, '_')
    @count = 6
  end

  def fill_board(guess)
    array = @guess_word.split('').each_index.select { |x| @guess_word[x] == guess }
    array.each { |x| @board[x] == guess }
  end

  def end
    @board.join('') == guess_word
  end

end
