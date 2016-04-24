require 'minitest/autorun'
require 'minitest/pride'

# Write a class which has an initialize method, a reader method, a private
# method, and a class method.

# When a method is declared private in ruby, it means this method can never be called with an explicit receiver
# So, call it with an implicit receiver and it will succeed.
# This means we can call a private method from within a class it is delcared in as well as all subclasses.
# To test a private method you simply need to 'call' a private method using 'send'

# Class methods are methods that are called on a class. When it is self.method_name, it is class method.
# WRITE YOUR CODE HERE.

class Goat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private
  def hate_cats
    "I hate cats!"
  end

  def self.number_of_legs
    4
  end

end


class ClassesChallenge < MiniTest::Test

  def test_class_exists
    assert Goat
  end

  def test_initialize
    assert Goat.new("Windsong")
  end

  def test_reader
    amalthea = Goat.new("Amalthea")
    assert_equal "Amalthea", amalthea.name
    assert_raises(NoMethodError) do
      amalthea.name = "Djali"
    end
  end

  def test_private
    billy = Goat.new("Billy Whiskers")
    assert_raises(NoMethodError) do
      billy.hate_cats
    end
    assert_equal "I hate cats!", billy.send(:hate_cats)
  end

  def test_class
    assert_equal 4, Goat.number_of_legs
  end
end
