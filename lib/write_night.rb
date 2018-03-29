require './lib/braille_translator'


file_text = File.open(ARGV[0], 'r')
incoming_braille = file_text.read.delete("\n")
file_text.close

message = BrailleTranslator.new(incoming_braille)

writer = File.open(ARGV[1], 'w')
writer.write(message.english_result)
writer.close
