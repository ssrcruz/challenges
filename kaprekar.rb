# My way. The newbie way.

def kaprekar?(k)
  number = k ** 2
  kaprekar = number.to_s
  if kaprekar.length == 5 && k == kaprekar[0..1].to_i + kaprekar[2..4].to_i
    return true
  elsif kaprekar.length == 2 && k == kaprekar.split('')[0].to_i + kaprekar.split('')[1].to_i
    return true
  elsif kaprekar.length < 5 && k == kaprekar[0..1].to_i + kaprekar[2..3].to_i
    return true
  elsif kaprekar.length > 5 && k == kaprekar[0..2].to_i + kaprekar[3..5].to_i
    return true
  else
    return false
  end
end

# The simpler way

def kaprekar?(k)
  no_of_digits = k.to_s.size
  square = (k ** 2).to_s

  second_half = square[-no_of_digits..-1]
  first_half = square.size.even? ? square[0..no_of_digits-1] : square[0..no_of_digits-2]

  k == first_half.to_i + second_half.to_i
end
