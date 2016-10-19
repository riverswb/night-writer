require 'minitest/autorun'
require 'minitest/pride'
require './lib/reader'

class ReaderTest < Minitest::Test

  def test_it_exists
    assert Reader.new
  end

  def test_character_limit_80
    reader = Reader.new
    insert = "the cat jumped over the moon and Fonzi jumped the shark and today is wednesday and then tomorrow is a new day"
    result = "the cat jumped over the moon and Fonzi jumped the shark and today is wednesday a\nnd then tomorrow is a new day"
    assert_equal result, reader.character_limit_80(insert)
  end


end
