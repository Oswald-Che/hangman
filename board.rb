# board for hangman game
require 'pry-byebug'
class Board
  attr_accessor :count
  
  def initialize
    dictionary = File.open('dictionary.txt').readlines.map(&:chomp)
    @guess_word = dictionary.select { |word| word.length.between?(5, 12) }.sample
    @board = Array.new(@guess_word.length, '_')
    @count = 6
  end

  def fill_board(guess)
    array = @guess_word.split('').each_index.select { |x| @guess_word[x] == guess }
    array.each { |x| @board[x] = guess }
  end

  def check_guess(guess)
    return false unless @guess_word.include?(guess)

    puts 'You a got letter correct'
    fill_board(guess)
    true
  end

  def display_word
    puts @board.join(' ')
  end

  def game_end
    @board.join('') == @guess_word
  end

  def save
  end

end
