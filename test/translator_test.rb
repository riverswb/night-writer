require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test

  def test_translator_exists
    assert Translator.new
  end

  def test_it_can_convert_a_single_character_to_braille
    translator = Translator.new
    result = ["0.","..",".."]
    assert_equal result, translator.english_to_braille("a")
  end

  def test_it_can_convert_a_single_capital_letter
    translator = Translator.new
    result = ["..0.", "....", ".0.."]
    assert_equal result, translator.english_to_braille("A")
  end

  def test_it_can_convert_a_string_to_braille
    translator = Translator.new
    input = "the"
    result = [".00.0.", "0000.0", "0....."]
    assert_equal result, translator.english_to_braille(input)
  end

  def test_it_can_convert_a_single_braille_character_to_english
    translator = Translator.new
    result = ["a"]
    assert_equal result, translator.braille_to_english("0.\n..\n..")
  end

  def test_convert_a_word_from_braille_to_english
    translator = Translator.new
    result = ["t","h","e"]
    assert_equal result, translator.braille_to_english(".00.0.\n0000.0\n0.....")
  end

  def test_compile_braille_sentences
    translator = Translator.new
    result = [".00.0.", "0000.0", "0....."]
    assert_equal result, translator.compile_braille_sentence(".00.0.", "0000.0", "0.....")
  end

  def test_prepare_braille_arrays
    translator = Translator.new
    result = [["0","."],[".","."],[".","."]]
    assert_equal result, translator.prepare_braille_arrays("0.\n..\n..")
  end

  def test_braille_converter
    translator = Translator.new
    result = [["0.","..",".."]]
    assert_equal result, translator.braille_converter("0.\n..\n..")
  end

  def test_compile_english_sentence_from_braille
    translator = Translator.new
    result = ["a"]
    assert_equal result, translator.compile_english_sentence_from_braille([["0.","..",".."]])
  end

  def test_upcase_shift_letters
    translator = Translator.new
    result = ["A"]
    assert_equal result, translator.upcase_shift_letters(["shift","a"])
  end

end
