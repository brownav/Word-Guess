class Display
  attr_accessor :flowers, :secret_word, :guess_letter

  def initialize
    @flowers = %W[(@)(@)(@)(@)]
    word = "desks"
    @secret_word = word.split("")
    @guess_letter = "m"

  end

  def print_flower
    puts "\n"
    @flowers.each do |flower|
      print "#{flower}\n"
    end
    puts " \\,\\,|,/,/,"
    puts "   _\\|/_   "
    puts "  |_____|  "
    puts "   |   |   "
    puts "   |___|   \n\n"
  end

  def remove_flower
    # remove flower from picture
    # flowers stored as elements in array?
    @flowers = [@flowers.shift]
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
    if !@secret_word.include?(@guess_letter)
      remove_flower
      # end game at 0 flowers
    end

  end

end

testdisplay = Display.new
testdisplay.print_flower
testdisplay.display_progress("m")













class SecretWord

  def initialize
  end

  def generate_secret_word
    # generate random unique word
    # for testing phase, secret_word = "desks"
    @secret_word = "desks"
    return @secret_word
  end

end


class Guess

  def initialize(user_guess)
    #
  end

  def check_guess
    # checks user_guess against
  end

end
