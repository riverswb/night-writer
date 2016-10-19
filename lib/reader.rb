require './lib/translator'
require './lib/file_reader'
require './lib/file_writer'

class Reader
  attr_reader :reader, :writer, :translator

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
    @translator = Translator.new
  end

  def translate_braille_to_english
    output = translator.braille_to_english(read_file)
    character_limit_80(output)
    writer.write_english(output)
  end

  def read_file
    reader.read
  end

  def character_limit_80(output)
    if output.length > 80
      output.insert(80, "\n")
    end
      output
  end
end
