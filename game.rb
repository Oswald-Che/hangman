require_relative 'board'
class Game

  def initialize
    @game_board = Board.new
  end

  def introduction
    puts 'Welcome to Hangman you have 6 tries to guess the code'
  end
  
  def start
    introduction
    load_game
    play
  end

  def play
    while @game_board.count > 0
      @game_board.save
      puts 'Please guess a letter'
      guess = input
      if @game_board.check_guess(guess)
        break if @game_board.game_end

        next
      end
      @game_board.count -= 1
      @game_board.draw_hangman

    end
  end

  def load_game
    puts 'Do you want to load a game 1.yes 2.no'
    return unless gets.chomp == '1'

    @game_board.load_file
    puts 'Current Game state is'
    @game_board.display_word
  end

  def input
    guess = gets.chomp.downcase
    if @game_board.board.include?(guess)
      puts 'word already guessed correctly'
      guess = input
    end
    guess
  end
end

Game.new.start