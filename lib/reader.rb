require './lib/translator'

class Reader
  attr_reader :reader, :writer, :translator

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
    @translator = Translator.new
  end

  def translate_braille_to_english
    # input = read_file
    output = translator.braille_to_english(read_file)
    # write_to_file_english(output)
    writer.write_english(output)
  end

  def write_to_file_english(output)
    binding.pry
    writer.write_english(output)
  end

  def read_file
    reader.read
  end


end
