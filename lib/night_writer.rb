require './lib/file_reader'
require './lib/alphabet'
require './lib/translator'

class NightWriter
  attr_reader :reader, :translator

  def initialize
    @reader = FileReader.new
    @translator = Translator.new
  end

  def read_file_length
    reader.read.length
  end

  def read_file
    reader.read
  end

  def translate_english_to_braille
    input = reader.read.chomp.gsub(/[^\p{Alnum}\p{Space}-]/, '')
    output = translator.english_to_braille(input)
    p output
  end

end
p "Created #{ARGV[1]} from #{ARGV[0]} containing #{NightWriter.new.read_file_length} characters"

NightWriter.new.translate_english_to_braille
