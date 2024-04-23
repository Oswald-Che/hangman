require 'json'
# board for hangman game
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
    if @guess_word.include?(guess)
      puts 'You a got letter correct'
      fill_board(guess)
      bool = true
    else
      puts "You got the letter wrong\nyou have #{count - 1} lives left"
      bool = false
    end
    display_word
    bool
  end

  def display_word
    puts "#{@board.join(' ')}\n\n"
  end

  def game_end
    @board.join('') == @guess_word
  end

  def save
    puts 'Do you want to save your Game 1. yes and 2. no'
    return unless gets.chomp == '1'

    Dir.mkdir 'save' unless Dir.exist? 'save'
    puts 'Please input save name'
    file_name = gets.chomp
    save_game(file_name)
  end

  def save_game(file_name)
    save_hash = {
      guess_word: @guess_word,
      board: @board,
      count: @count
    }

    File.open("save/#{file_name}.txt", 'w') do |file|
      file.puts JSON.dump(save_hash)
    end
  end

  def load_game(load_hash = {})
    puts 'input name of save you want to load'
    puts "Available saves are #{Dir.entries('save')}"
    file_name = gets.chomp
    File.open("save/#{file_name}.txt", 'r') do |file|
      load_hash = JSON.load(file)
    end
    @count = load_hash[:count]
    @guess_word = load_hash[:guess_word]
    @board = load_hash[:board]
  end

end
