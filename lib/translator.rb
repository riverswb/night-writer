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
    braille_1 = input.chars.map do |thing|
    	alphabet.alphanumeric[thing][0]
    end.join
    braille_2 = input.chars.map do |thing|
    	alphabet.alphanumeric[thing][1]
    end.join
    braille_3 = input.chars.map do |thing|
    	alphabet.alphanumeric[thing][2]
    end.join
    compile_braille_sentence(braille_1, braille_2, braille_3)
  end

    def compile_braille_sentence(braille_1, braille_2, braille_3)
      braille_sentence = []
      braille_sentence << braille_1
      braille_sentence << braille_2
      braille_sentence << braille_3
      braille_sentence
    end

  def braille_to_english(input)
    @work = input
    letters = braille_converter
    output = compile_english_sentence_from_braille(letters)
    upcase_shift_letters(output)
  end

  def braille_converter
    prepare_braille_arrays
    while letters[0].empty? == false do
      answer = []
      @letters.each do |letter|
        answer << letter.slice!(0,2).join
      end
      @answers << answer
    end
    @answers
  end

  def prepare_braille_arrays
    @letters << @work.split("\n")[0].chars
    @letters << @work.split("\n")[1].chars
    @letters << @work.split("\n")[2].chars
  end

  def compile_english_sentence_from_braille(letters)
    letters.map do |letter|
      alphabet.braille[letter]
    end
  end


  def upcase_shift_letters(output)
    output.each_with_index do |letter, index|
      if letter == "shift"
        output[index + 1].upcase!
        output.delete_at(index)
      else
        letter
      end
    end
  end
end

# Translator.new.english_to_braille("Brett and Mike")
# Translator.new.braille_to_english(["0.","0.",".."])
