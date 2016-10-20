require './lib/reader'
require './lib/file_reader'
require './lib/file_writer'
require './lib/translator'

class NightReader
  attr_reader :reader, :translator, :writer

  def initialize
    @reader = FileReader.new
    @translator = Translator.new
    @writer = FileWriter.new
  end

  def read_file_length
    reader.read.length
  end

end

p "Created #{ARGV[1]} from #{ARGV[0]} containing #{NightReader.new.read_file_length / 3} characters"

Reader.new.translate_braille_to_english
