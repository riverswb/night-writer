require './lib/alphabet'

class Translator
  attr_reader :alphabet
  def initialize
    @alphabet = Alphabet.new
  end

  def english_to_braille(input)
    braille_sentence = []
    braille_1 = input.chars.map do |letter|
    	alphabet.alphanumeric[letter][0]
    end.join

    braille_2 = input.chars.map do |letter|
    	alphabet.alphanumeric[letter][1]
    end.join

    braille_3 = input.chars.map do |letter|
    	alphabet.alphanumeric[letter][2]
    end.join
    braille_sentence << braille_1
    braille_sentence << braille_2
    braille_sentence << braille_3
    binding.pry
    braille_sentence
  end

  def braille_to_english(input)
    poop = input.split("\n")
    letter = []
    letter << poop[0].chars.shift(2).join
    letter << poop[1].chars.shift(2).join
    letter << poop[2].chars.shift(2).join
    first = alphabet.alphanumeric.find_all do |key, value|
    	value[0] == letter[0]
    end.to_h
    binding.pry
    second = first.find_all do |key, value|
    	value[1] == letter[1]
    end.to_h
    third = second.find_all do |key, value|
    	value[2] == letter[2]
    end.to_h.keys.to_s
  end
end

# Translator.new.english_to_braille("Brett and Mike")
# Translator.new.braille_to_english(["0.","0.",".."])
