require './lib/translator'
require './lib/file_writer'
require './lib/file_reader'

class Writer

  attr_accessor :reader, :writer, :translator

  def initialize
    @reader = FileReader.new
    @translator = Translator.new
    @writer = FileWriter.new
  end

  def translate_english_to_braille
    input = read_file.chomp.gsub(/[^\p{Alnum}\p{Space}!',-.?#]/, '')
    output = translator.english_to_braille(input)
    character_limit_160(output)
    # write_to_file_braille(output)
    writer.write_braille(output)
  end

  def character_limit_160(output)
    if output[0].length > 160
      output.map do |string|
        string_limit(output, string)
      end
      output
    end
  end
  # def write_to_file_braille(output)
  def string_limit(output, string)
    if string.length > 160
      output << string.slice!(160..-1)
    end
  end
  #   binding.pry
  #   writer.write_braille(output)
  # end

  def read_file
    reader.read
  end







end
