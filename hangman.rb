require 'faker'
class GamePlay
  attr_accessor :play

  def initialize (play)
    @play = play
  end

  def quit_or_play_game
    if @play == "n"
      puts "\nGoodbye!"
      exit
    elsif @play == "y"
      new_word = GenerateWord.new
      word_array = new_word.fake_word
      guess = Guess.new(word_array)
      picture = Display.new(4)
      picture.print_flower

      while @play == "y"
        print "Word: #{guess.progress}\n"
        print "Enter letter > "
        letter = gets.chomp.downcase
        guess.compare(letter)
      end
    end
  end

end

class GenerateWord
  attr_accessor :word

  def initialize
    @word = word
  end

  def fake_word
    @word = Faker::HarryPotter.character
    @word = @word.split("")
    return @word
  end

end

class Display
  attr_accessor :flowers, :wrong_letters

  def initialize(wrong_letters)
    @wrong_letters = wrong_letters
    @flower = "(@)"
  end

  def print_flower
    puts "\n"
    @wrong_letters.times { |i| print "#{@flower}" }
    puts
    puts " \\,\\,|,/,/"
    puts "   _\\|/_   "
    puts "  |_____|  "
    puts "   |   |   "
    puts "   |___|   \n\n"
  end
end

class Guess
  attr_accessor :letter, :word, :progress, :wrong_letters

  def initialize(word)
    @word = word
    progress = []
    @wrong_letters = []
    @word.length.times do
      progress.push("_")
    end
    @progress = progress
  end

  def compare(letter)
    @letter = letter
    if @letter.length > 1 || @letter == "quit"
      quit_game = GamePlay.new("n")
      quit_game.quit_or_play_game
    elsif @word.include?(@letter)
      @word.each_with_index do |value, index|
        if value == @letter
          @progress.delete_at(index)
          @progress.insert(index, @letter)
        end
      end
      return @progress
    else
      @wrong_letters.push(@letter)
    end
    flowers_remaining = 4 - @wrong_letters.length
    flower_points = Display.new(flowers_remaining)
    if flowers_remaining >= 1
      flower_points.print_flower
    else
      puts "Game over.\n"
      @word = @word.join("")
      puts "Secret Word: #@word"
      exit
    end
  end
end

puts "Would you like to play a game of HANGMAN?"
print "Type Y or N: "
user_response = gets.chomp.downcase

round1 = GamePlay.new(user_response)
round1.quit_or_play_game
