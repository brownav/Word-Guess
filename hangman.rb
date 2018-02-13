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
      print picture.display_progress

      guess = Guess.new(word_array)

      while @play == "y"
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

  def display_progress
    display = Guess.new(@word_array)
    print "Word: "
    print display.progress_array
    puts "\n"
  end

end

class Guess
  attr_accessor :letter, :word, :progress

  def initialize(word)
    @word = word
  end

  def compare(letter)
    @letter = letter
    guesses_list = []

    if @letter.length > 1 || @letter == "quit"
      quit_game = GamePlay.new("n")
      quit_game.quit_or_play_game
    elsif @word.include?(@guess)

      @word.each do |match|
        if match == @letter
          @word[match] = index

          @progress_array
          ### .map the @letter value within progress_array





    else
      guesses_list.push(@guess)

    end


  end

  def progress_array
    @progress = []
    @word.length.times do
      @progress.push("_")




    end
    return @progress.join(" ")
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
