require 'minitest/autorun'
require 'minitest/pride'

# Write two methods:
#
#   * `first_name`: given a name in string, return the first name.
#   * `last_name`: given a name in string, return the last name.

# WRITE YOUR CODE HERE.

def first_name(name) # name will be given

  if name.nil? || name == "" # if name equals nil or if it equals an empty string, return empty string.
    ""
  elsif name.split().count == 1 # If the name can be split and be put inside an array, and the count of the array is 1,
    name.split().first          # It will proceed to split the array, and it should return the name given.
  elsif name.split().count == 3 # If the name is split and has a count of 3,
    name.rpartition(" ").first  # It will take the name using rpartition, which searches for the rightmost occurence and splits it
  elsif name.split().count == 2
    name.split().first
  end

end

def last_name(name)

  if name.nil? || name == ""
    ""
  elsif name.split().count == 1
    name.rpartition("").last
  elsif name.split().count == 3
    name.rpartition(" ").last
  elsif  name.split().count == 2
    name.split().last
  end

end

class StringSplitChallenge < MiniTest::Test
  def test_first_name
    assert_equal "Mason", first_name("Mason Matthews")
  end

  def test_last_name
    assert_equal "Matthews", last_name("Mason Matthews")
  end

  def test_one_word_name
    assert_equal "deadmou5", first_name("deadmou5")
    assert_equal "", last_name("deadmou5")
  end

  def test_three_word_name
    assert_equal "John Quincy", first_name("John Quincy Adams")
    assert_equal "Adams", last_name("John Quincy Adams")
  end

  def test_no_word_name
    assert_equal "", first_name("")
    assert_equal "", last_name("")
  end

  def test_nil_name
    assert_equal "", first_name(nil)
    assert_equal "", last_name(nil)
  end
end
