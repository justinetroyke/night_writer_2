require './lib/braille_translator'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class BrailleTranslatorTest < Minitest::Test

 def test_class_exists_and_takes_input
   translator = BrailleTranslator.new("0.00..0..0..0")

   assert_instance_of BrailleTranslator, translator
   assert_equal "0.00..0..0..0", translator.input
 end

 def test_splits_string_into_thirds_in_new_array
   translator = BrailleTranslator.new("0.00..0..0..")

   assert_equal ["0.00", "..0.", ".0.."], translator.split
 end

 def scan_all_strings
   translator = BrailleTranslator.new("0.00..0..0..")

   assert_equal ["0.", "00"], translator.top
   assert_equal ["..", "0."], translator.mid
   assert_equal [".0", ".."], translator.bottom
 end

 def zip_strings_into_braille_equivalent
   translator = BrailleTranslator.new("0.00..0..0..")

   assert_equal ["0.","..",".0"]["00", "0.", ".."], translator.zip_characters_together
 end

 def convert_zipped_arrays_to_english
   translator = BrailleTranslator.new("0.....0.0...")

   assert_equal "ab", translator.conver_to_english
 end


end
