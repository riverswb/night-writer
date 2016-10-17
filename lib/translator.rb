require './lib/alphabet'

class Translator
  attr_reader :alphabet
  def initialize
    @alphabet = Alphabet.new
  end

  def english_to_braille(string)
    braille_sentence = []
    braille_1 = string.chars.map do |letter|
    	alphabet.lowercase[letter][0]
    end.join

    braille_2 = string.chars.map do |letter|
    	alphabet.lowercase[letter][1]
    end.join

    braille_3 = string.chars.map do |letter|
    	alphabet.lowercase[letter][2]
    end.join
    braille_sentence << braille_1 + "\n"
    braille_sentence << braille_2 + "\n"
    braille_sentence << braille_3 + "\n"
    braille_sentence
  end

  def braille_to_english(letter)
    first = alphabet.lowercase.find_all do |key, value|
    	value[0] == letter[0]
    end.to_h

    second = first.find_all do |key, value|
    	value[1] == letter[1]
    end.to_h

    third = second.find_all do |key, value|
    	value[2] == letter[2]
      # binding.pry
    end.to_h.keys.to_s
  end

end

# Translator.new.english_to_braille("brett and mike")
# Translator.new.braille_to_english(["0.","0.",".."])
