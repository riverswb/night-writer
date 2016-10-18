require './lib/file_reader'
require './lib/file_writer'
require './lib/translator'

class NightWriter
  attr_reader :reader, :translator, :output, :writer

  def initialize
    @reader = FileReader.new
    @translator = Translator.new
    @writer = FileWriter.new
    @output = output
  end

  def read_file_length
    reader.read.length
  end

  def read_file
    reader.read
  end

  def write_to_file_braille
    writer.write_braille(output)
  end

  def translate_english_to_braille
    input = read_file.chomp.gsub(/[^\p{Alnum}\p{Space}!',-.?#]/, '')
    @output = translator.english_to_braille(input)
    write_to_file_braille
  end

  def translate_braille_to_english
    input = read_file
    @output = translator.braille_to_english(input)
    write_to_file_english
  end

  def write_to_file_english
    writer.write_english(output)
  end

end

# if FileReader.new.read.length < 81
  p "Created #{ARGV[1]} from #{ARGV[0]} containing #{NightWriter.new.read_file_length} characters"

  # NightWriter.new.translate_english_to_braille
  NightWriter.new.translate_braille_to_english
# else
#   p "Sorry the message should be less than 80 characters!"
# end
