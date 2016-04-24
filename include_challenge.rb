require 'minitest/autorun'
require 'minitest/pride'


# Write code which will be included in the human class which will give humans
# intelligent and bipedal behavior.

# WRITE YOUR CODE BELOW THIS COMMENT...

# Class Human inherits from both modules Intelligent and Bipedal
# which shows multiple inheritance or 'mixins'
module Intelligent # module Intelligent has two methods say_name and number_of_brains
  NUMBER_OF_BRAINS = 1
  def say_name
    "My name is #{@name}"
  end

  def number_of_brains
    1
  end


end
module Bipedal # module Bipedal has two methods run and number_of_legs
  NUMBER_OF_LEGS = 2
  def run
    "Huff puff huff puff"
  end

  def number_of_legs
    2
  end

end


# ...AND ABOVE THIS COMMENT.  DO NOT EDIT THE HUMAN CLASS BELOW.

class Human
  include Intelligent # class Human includes the Intelligent module, which means it has access to methods say_name and number_of_brains
  include Bipedal # class Human includes Bipedal, which means it has access to methods run and number_of_legs

  def initialize(name)
    @name = name
  end

end

class IncludeChallenge < MiniTest::Test

  def test_speaking
    assert_equal "My name is Zelda", Human.new("Zelda").say_name
    assert_equal "My name is Mary", Human.new("Mary").say_name
    assert_equal "My name is Amanda", Human.new("Amanda").say_name
  end

  def test_running
    assert_equal "Huff puff huff puff", Human.new("Zelda").run
    assert_equal "Huff puff huff puff", Human.new("Mary").run
  end

  def test_constants
    assert_equal 2, Human::NUMBER_OF_LEGS
    assert_equal 1, Human::NUMBER_OF_BRAINS
  end

  def test_methods_like_constants
    human = Human.new("Zelda")
    assert_equal 2, human.number_of_legs
    assert_equal 1, human.number_of_brains
  end

end
