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

      picture = Display.new(word_array)
      picture.print_flower
      # print picture.display_progress
      guess = Guess.new(word_array)
      print "Word: #{guess.progress}"
      while @play == "y"
        print "\nEnter letter > "
        letter = gets.chomp.downcase
        puts guess.compare(letter)
        # compare word to letter
        # display progress
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
  attr_accessor :flowers, :word_array, :progress, :display

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

  # def display_progress
  #   display = Guess.new(@word_array)
  #   print "Word: "
  #   print display
  #   puts "\n"
  # end

end

class Guess
  attr_accessor :letter, :word, :progress

  def initialize(word)
    @word = word
    progress = []
    @word.length.times do
      progress.push("_")
    end
    @progress = progress.join(" ")
  end

  def compare(letter)
    @letter = letter
    guesses_list = []

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
      #pop off a bud
    end
    guesses_list.push(@guess)
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
