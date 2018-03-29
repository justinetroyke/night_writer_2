require './lib/translator'
require './lib/writer'
require 'pry'


  file_text = File.open(ARGV[0], 'r')
  incoming_english = file_text.read.delete("\n")
  file_text.close

  braille_message = Translator.new(incoming_english)
  output_message = Writer.new(braille_message.braille_result)

  writer = File.open(ARGV[1], 'w')
  writer.write(output_message.write_braille)
  writer.close

   puts "Created '#{ARGV[1]}' containing #{output_message.write_braille.length} characters"
