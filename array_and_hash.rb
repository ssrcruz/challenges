require 'minitest/autorun'
require 'minitest/pride'
require 'enumerator'

# Write a method which accepts an array and returns a hash.  Each item in the
# array will be a string, and the returned hash should have last names as keys
# and first names as values.
# Arrays are ordered, integer-indexed collections of any object.
# While a Hash is a collection of key-value pairs. The defualt value is nil for a hash.

# WRITE YOUR CODE HERE.  Name your method `names`.

def names(array)
  hash = {}
  return hash if array.nil?
  array.each do |full_name|
    first_name = full_name.split.first
    last_name = full_name.split.last
    hash[last_name] = first_name
  end
    hash
end

class ArrayAndHashChallenge < MiniTest::Test

  def test_one_name
    expected = {"Washington" => "George"}
    assert_equal expected, names(["George Washington"])
  end

  def test_complex_name
    expected = {"Adams" => "John"}
    assert_equal expected, names(["John Quincy Adams"])
  end

  def test_two_names
    expected = {"Washington" => "George", "Adams" => "John"}
    assert_equal expected, names(["George Washington", "John Quincy Adams"])
  end

  def test_no_names
    assert_equal Hash.new, names(Array.new)
  end

  def test_no_array
    assert_equal Hash.new, names(nil)
  end

  def test_last_names_overwrite
    expected = {"Washington" => "George", "Roosevelt" => "Franklin"}
    assert_equal expected, names(["George Washington", "Theodore Roosevelt", "Franklin Roosevelt"])
  end
end
