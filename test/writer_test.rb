require 'minitest/autorun'
require 'minitest/pride'
require './lib/writer'

class WriterTest < Minitest::Test

  def test_writer_exists
    assert Writer.new
  end

  def test_character_limit_160
    writer = Writer.new
    insert = ["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0..0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0"]
    result = ["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0..0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0", ".0.0.0.0.0.0.0.0.0"]

    assert_equal result, writer.character_limit_160(insert)
  end
  # 
  # def test_something
  #   writer = Writer.new
  #   binding.pry
  #   writer.reader.read = "hello"
  #   assert_equal "", translator.translate_english_to_braille
  # end


end
