



class GamePlay
  attr_accessor :play

  def initialize (play)
    @play = play
  end

  def quit_or_play_game
    if @play == "n"
      puts "Goodbye!"
      exit
    elsif @play == "y"

      new_word = GenerateWord.new
      word_array = new_word.fake_word
      picture = Display.new(word_array)
      picture.print_flower

      ## call GenerateWord class
        # withing GenerateWord call DisplayPicture
        # call DisplayPicture once when generated, then call updated form in Guess

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
  attr_accessor :flowers, :word_array

  def initialize(word_array)
    @flowers = ["(@)", "(@)", "(@)", "(@)"]
    @word_array = word_array
  end

  def print_flower
    puts "\n"
    @flowers.each do |flower|
      print "#{flower}"
    end
    puts
    puts " \\,\\,|,/,/"
    puts "   _\\|/_   "
    puts "  |_____|  "
    puts "   |   |   "
    puts "   |___|   \n\n"
  end

  def remove_flower
    @flowers.delete_at(-1)
    print_flower
  end

  def display_progress(letter)
    # change dashes to letter for correct guess
    @guess_letter = letter
    print "Word: "
    @secret_word.length.times do
      print "_"
    end
    puts "\n"
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
# class Guess
#
#   def initialize(user_guess)
#     #
#   end
#
#   def check_guess
#     # checks user_guess against
#   end
#
# end
