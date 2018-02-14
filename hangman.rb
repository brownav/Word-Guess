require 'faker' #comment ln:50 && uncomment ln:51 for harry potter theme
require 'random_word_generator'
require 'colorize'

# main class which initiates games and calls other classes based on user_response
class GamePlay
  attr_accessor :play, :wrong_guesses, :progress

  def initialize(play)
    @play = play
  end

  def quit_or_play_game
    if @play == "n"
      puts "\nGoodbye!"
      exit
    elsif @play == "y"
      new_word = GenerateWord.new
      word_array = new_word.create_fake_word
      user_guess = Guess.new(word_array)
      picture = Display.new(6)
      picture.print_flower

      while @play == "y"
        print "Word: #{user_guess.progress}\n"
        puts "Incorrect guesses: #{user_guess.wrong_guesses.join(" ")}"

        if word_array.join(" ") == user_guess.progress
            puts "\nCongrats! You win!"
            exit
          end

        print "Enter letter > "
        letter = gets.chomp.downcase
        user_guess.compare(letter)
      end
    end
  end
end

# creates a random word for the user to guess
class GenerateWord
  attr_accessor :word

  def initialize
    @word = word
  end

  def create_fake_word
    @word = RandomWordGenerator.word
    #@word = Faker::HarryPotter.character
    @word = @word.split("")
    return @word
  end

end

class Guess
  attr_accessor :letter, :word, :progress, :wrong_guesses

  def initialize(word)
    @word = word
    progress = []
    @wrong_guesses = []
    @word.length.times do
      progress.push("_")
    end
    @progress = progress.join(" ")
  end

  def compare(letter)
    @letter = letter
    if @letter == "quit"
      quit_game = GamePlay.new("n")
      quit_game.quit_or_play_game
    elsif @word.include?(@letter)
      @progress = progress.split(" ")
      @word.each_with_index do |value, index|
        if value == @letter
          @progress.delete_at(index)
          @progress.insert(index, @letter)
        end
      end
      @progress = progress.join(" ")
    else
      @wrong_guesses.push(@letter)
    end

    flowers_remaining = 6 - @wrong_guesses.length
    flower_points = Display.new(flowers_remaining)

    if flowers_remaining > 0
      puts flower_points.print_flower
    else
      puts "\nNo more guesss! Game over! \n"
      @word = @word.join("")
      puts "The word was: #@word"
      exit
    end
  end
end

  class Display
    attr_accessor :flowers, :flowers_remaining

    def initialize(flowers_remaining)
      @flowers_remaining = flowers_remaining
      @flower = "(@)".colorize(:red)
    end

    def print_flower
      puts "\n"
      @flowers_remaining.times { |i| print "#{@flower}" }
      puts
      puts "  \\,\\,\\,|,/,/,/".colorize(:green)
      puts "   \\_\\__|__/_/  ".colorize(:green)
      puts "    |________|    ".colorize(:blue)
      puts "    |  Roses |    ".colorize(:blue)
      puts "    |________|    ".colorize(:blue)
      puts
    end
  end

  # prompts user
  puts "Would you like to play Hangman?"
  puts "- Type 'Y' for yes"
  puts "- Yype 'N' for no"
  puts "- Type 'Quit' to exit game\n"
  print "\nEnter selection > "
  user_response = gets.chomp.downcase

  initiate = GamePlay.new(user_response)
  initiate.quit_or_play_game
