=begin
Our general algorithm is as follows:
  1. Take string and make into array of chars as to access each char
  2. Gather positional values of the alphabet and put them into a hash, actually this part may be unnecessary
  3. Find positional values of the given chars added to the number we shift by and find the corresponding character
  4. Add those characters into an array, convert that back to a string and return.

Notes:
  -If the given chars shift value pushes it beyond Z's positional value we need to wrap the value as if it is from 0

  -We need to use the ACII values to tell us if it is a space or capitalized as well
=end





def caesar_cipher(string, iShift)
  #Create an array of the words
  wordsM = string.split("")

  for letter in a..z
    lowercase = Hash[('a'.ord..'z'.ord).map {|num|}]
  end


  wordsM.each do |char|
    if char.ord in lowercase
  end

end

caesar_cipher("What a string!", 5)