=begin
Our general algorithm is as follows:
  1. Take string and make into array of chars as to access each char
  2. Gather positional values of the alphabet and put them into a hash, actually this part may be unnecessary
  3. Find positional values of the given chars added to the number we shift by and find the corresponding character
  4. Add those characters into an array, convert that back to a string and return.

Notes:
  -If the given chars shift value pushes it beyond Z's positional value we need to wrap the value as if it is from 0

  -We need to use the ASCII values to tell us if it is a space or capitalized as well
=end

require 'sinatra'
require 'sinatra/reloader'

def caesar_cipher(string, iShift)
  #Create an array of the words
  wordsM = string.split("")

  lowercase = Hash.new{}
  uppercase = Hash.new{}
  newWordsM = []

  for letter in 'a'..'z'
    lowercase[letter] = letter.ord
  end

  for letter in 'A'..'Z'
    uppercase[letter] = letter.ord
  end

  wordsM.each do |char|
    if lowercase.key?(char)
      iNew = lowercase[char] + iShift
      while(iNew > 'z'.ord)
        iNew = (iNew-'z'.ord)+('a'.ord() -1)
      end
    elsif uppercase.key?(char)
      iNew = uppercase[char] + iShift
      while(iNew > 'Z'.ord)
        iNew = (iNew-'Z'.ord)+('A'.ord() -1)
      end
    else
      iNew = char.ord
    end
    newWordsM.push(iNew.chr)
  end

  cipher = newWordsM.join

  return cipher
end


get '/' do
  phrase = params["phrase"]
  num = params["num"].to_i

  if !phrase.nil? then cipher = caesar_cipher(phrase, num) end
  erb :index, :locals => {:cipher => cipher}
end

=begin
  puts 'What is your desired phrase to encrypt?'
  string = gets

  puts 'What is your desired number to shift by?'
  num = gets.to_i
=end