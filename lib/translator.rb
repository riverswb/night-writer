require './lib/alphabet'


class Translator
  attr_reader :alphabet, :answers
  def initialize
    @alphabet = Alphabet.new
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
    letters = braille_converter(input)
    output = compile_english_sentence_from_braille(letters)
    upcase_shift_letters(output)
  end

  def braille_converter(input)
    letters = prepare_braille_arrays(input)
    answers = []
    while letters[0].empty? == false do
      answer = []
      letters.each do |letter|
        answer << letter.slice!(0,2).join
      end
      answers << answer
    end
    answers
  end

  def prepare_braille_arrays(input)
    letters = []
    letters << input.split("\n")[0].chars
    letters << input.split("\n")[1].chars
    letters << input.split("\n")[2].chars
    letters
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
