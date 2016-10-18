require './lib/file_reader'
require './lib/file_writer'
require './lib/translator'
require './lib/writer'


class NightWriter
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

# if FileReader.new.read.length < 81
  p "Created #{ARGV[1]} from #{ARGV[0]} containing #{NightWriter.new.read_file_length} characters"

  # NightWriter.new.translate_english_to_braille
  Writer.new.translate_english_to_braille
# else
#   p "Sorry the message should be less than 80 characters!"
# end
