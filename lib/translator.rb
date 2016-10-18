require './lib/alphabet'

class Translator
  attr_reader :alphabet, :work
  def initialize
    @alphabet = Alphabet.new
    @work = work
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
    @work = input
    letter = braille_converter
    first = alphabet.alphanumeric.find_all do |key, value|
    	value[0] == letter[0]
    end.to_h
    second = first.find_all do |key, value|
    	value[1] == letter[1]
    end.to_h
    third = second.find_all do |key, value|
    	value[2] == letter[2]
    end.to_h.keys.to_s
    binding.pry
    
  end

  def braille_converter
    letters = []
    answer = []
    letters << @work.split("\n")[0].chars
    letters << @work.split("\n")[1].chars
    letters << @work.split("\n")[2].chars
    letters.each do |poo|
      answer << poo.slice!(0,2).join

      # binding.pry
    # end
    # letter <<  poo.chars.shift(2).join
    end
    answer
    # binding.pry
  end
end

# Translator.new.english_to_braille("Brett and Mike")
# Translator.new.braille_to_english(["0.","0.",".."])
