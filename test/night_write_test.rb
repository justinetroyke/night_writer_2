require './lib/night_write'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class FileReaderTest < Minitest::Test

  def test_it_exists
    file_reader = FileReader.new

    assert_instance_of FileReader, file_reader
  end

  def test_it_can_write_to_an_output_file_from_an_input
    file_reader = FileReader.new

    assert_equal "hello world, hello world, hello world", file_reader.read(message)
  end
end
