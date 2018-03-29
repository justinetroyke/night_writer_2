require './lib/translator'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class TranslatorTest < Minitest::Test

  def test_it_exists
    translator = Translator.new("hello world")

    assert Translator, translator
  end

  def test_it_initializes_with_input
    translator = Translator.new("hello world")

    assert_equal "hello world", translator.input
  end

  def test_it_has_braille_alphabet
    translator = Translator.new("hello world")

    assert_instance_of Hash, translator.braille_alphabet
  end

  def test_split_characters
    translator = Translator.new("ab")

    assert_equal ["a", "b"], translator.split_message
  end

  def test_the_downcase_characters_can_be_translated
    translator = Translator.new("ab")

    assert_equal [['0.','..','..'],['0.','0.','..']], translator.convert_to_braille
  end

  def test_it_converts_one_letter_to_the_top_row_of_braille_character
    translator = Translator.new('ab')

    assert_equal "0.0.", translator.top
  end

  def test_it_converts_one_letter_to_the_mid_row_of_braille_character
    translator = Translator.new('ab')

    assert_equal "0.0.", translator.top
    assert_equal "..0.", translator.mid
  end

  def test_it_converts_one_letter_to_the_bottom_row_of_braille_character
    translator = Translator.new('ab')

    assert_equal "0.0.", translator.top
    assert_equal "..0.", translator.mid
    assert_equal "....", translator.bottom
  end

  def test_it_outputs_a_6_x_3_grid_for_two_letters
    translator = Translator.new("he")

    assert_equal ["0.0.","00.0","...."], translator.braille_result
  end

  def test_it_outputs_a_3_row_grid_for_a_word
    translator = Translator.new("hello")

    assert_equal ["0.0.0.0.0.","00.00.0..0","....0.0.0."], translator.braille_result
  end

  def test_it_can_space
    translator = Translator.new(" ")
    translator_2 = Translator.new("h e")

    assert_equal ["..","..",".."], translator.braille_result
    assert_equal ["0...0.","00...0","......"], translator_2.braille_result
  end

  def test_it_outputs_3_row_grid_for_phrase
    translator = Translator.new("hello world")

    assert_equal ["0.0.0.0.0....00.0.0.00","00.00.0..0..00.0000..0","....0.0.0....00.0.0..."], translator.braille_result
  end

  def test_message_is_all_lowercase_and_has_shift_for_capital
    translator = Translator.new("Ab")

    assert_equal ["shift","a","b"], translator.lower_case
  end

  def test_it_capitalizes_one_letter
    translator = Translator.new("A")

    assert_equal ["..0.", "....", ".0.."], translator.braille_result
  end

  def test_it__can_convert_a_symbol
    translator = Translator.new("?")

    assert_equal "..", translator.top
    assert_equal "0.", translator.mid
    assert_equal "00", translator.bottom
  end

  def test_it_can_convert_all_symbols
    translator = Translator.new("!',-.?")

    assert_equal "............", translator.top
    assert_equal "00..0...000.", translator.mid
    assert_equal "0.0...00.000", translator.bottom
  end
end
