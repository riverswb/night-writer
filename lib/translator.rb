require './lib/alphabet'

class Translator
  attr_reader :alphabet, :work, :letters, :answers, :english_sentence
  def initialize
    @alphabet = Alphabet.new
    @work = work
    @letters = []
    @answers = []
    @english_sentence = []
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
    letters = braille_converter
    letters.each do |letter|
      first = alphabet.alphanumeric.find_all do |key, value|
      	value[0] == letter[0]
      end.to_h
      second = first.find_all do |key, value|
      	value[1] == letter[1]
      end.to_h
      third = second.find_all do |key, value|
      	value[2] == letter[2]
      end.to_h.keys.to_s
      @english_sentence << third.gsub(/[^\p{Alnum}\p{Space}-]/, '')
    end
    english_sentence.join

    # binding.pry

  end

  def braille_converter
    @letters << @work.split("\n")[0].chars
    @letters << @work.split("\n")[1].chars
    @letters << @work.split("\n")[2].chars
    while letters[0].empty? == false do
      answer = []
      @letters.each do |poo|
        answer << poo.slice!(0,2).join
      end
      @answers << answer
    end
    @answers
  end
end

# Translator.new.english_to_braille("Brett and Mike")
# Translator.new.braille_to_english(["0.","0.",".."])
