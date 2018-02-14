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

      while @play == "y"
        picture.print_flower

        print "Word: #{guess.progress}\n"
        print "Enter letter > "
        letter = gets.chomp.downcase
        puts guess.compare(letter)


        #print "Word: #{guess.progress}\n"
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
    @word = "desks"
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

  def remove_flower
    @wrong_letters = wrong_letters - 1
    print_flower
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
    @progress = progress.join(" ")
  end

  def compare(letter)
    @letter = letter
    if @letter.length > 1 || @letter == "quit"
      quit_game = GamePlay.new("n")
      quit_game.quit_or_play_game
    elsif @word.include?(@letter)
      @word.map! do |match|
        if match == @letter
          @letter
        else
          "_"
        end
      end
      @progress = @word
      return @progress.join(" ")
    else
      wrong_guess = Display.new(4)
      wrong_guess.remove_flower
    end
    @wrong_letters.push(@letter)
    puts @wrong_letters
  end
end

puts "Would you like to play a game of HANGMAN?"
print "Type Y or N: "
user_response = gets.chomp.downcase

round1 = GamePlay.new(user_response)
round1.quit_or_play_game


#
# testdisplay = Display.new
# #testdisplay.print_flower
# testdisplay.display_progress("m")
# testdisplay.remove_flower
#
#
# # if !@secret_word.include?(@guess_letter)
# #   remove_flower
# # end
#   # end game at 0 flowers
#
#
#
#

#
#
