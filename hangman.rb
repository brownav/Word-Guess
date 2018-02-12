class Display
  attr_reader :flowers

  def initialize
    @flowers = %W[(@)(@)(@)(@)]
  end

  def print_flower
    @flowers.each do |i|
      print "#{i}\n"
    end
  end

    #print "#{@flowers}\n"

# print  @flowers
# puts ",\,\,|,/,/,"
# puts "   _\|/_   "
# puts "  |_____|  "
# puts "   |   |   "
# puts "   |___|   "

  def remove_flower
    # remove flower from picture
    # flowers stored as elements in array?
  end

  def display_progress(letter)
    # displays dashes
    # change dashes to letter for correct guess
  end

end

testdisplay = Display.new
testdisplay.print_flower











class SecretWord

  def initialize
  end

  def generate_secret_word
    # generate random unique word
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
