require 'pry'

class BrailleTranslator

 attr_reader :input

 def initialize(input)
   @input = input
   @english_alphabet = {
     ['0.','..','..']=>"a",
     ['0.','0.','..']=>"b",
     ['00','..','..']=>"c",
     ['00','.0','..']=>"d",
     ['0.','.0','..']=>"e",
     ['00','0.','..']=>"f",
     ['00','00','..']=>"g",
     ['0.','00','..']=>"h",
     ['.0','0.','..']=>"i",
     ['.0','00','..']=>"j",
     ['0.','..','0.']=>"k",
     ['0.','0.','0.']=>"l",
     ['00','..','0.']=>"m",
     ['00','.0','0.']=>"n",
     ['0.','.0','0.']=>"o",
     ['00','0.','0.']=>"p",
     ['00','00','0.']=>"q",
     ['0.','00','0.']=>"r",
     ['.0','0.','0.']=>"s",
     ['.0','00','0.']=>"t",
     ['0.','..','00']=>"u",
     ['0.','0.','00']=>"v",
     ['.0','00','.0']=>"w",
     ['00','..','00']=>"x",
     ['00','.0','00']=>"y",
     ['0.','.0','00']=>"z",
     ['..','..','..']=>" ",
     ['..','..','.0']=>"shift",
     ['..','0.','00']=>"?",
     ['..','..','0.']=>"'",
     ['..','00','0.']=>"!",
     ['..','0.','..']=>",",
     ['..','00','.0']=>".",
     ['..','..','00']=>"-"
    }
 end


 def split
   number = (@input.length / 3)
   @input.scan(/.{1,#{number}}/)
 end

 def top
   out_top = []
   out_top << split.fetch(0).scan(/../)
   return out_top.flatten
 end

 def mid
   out_mid = []
   out_mid << split.fetch(1).scan(/../)
   return out_mid.flatten
 end

 def bottom
   out_bottom = []
   out_bottom << split.fetch(2).scan(/../)
   return out_bottom.flatten
 end

 def zip_characters_together
   top.zip(mid, bottom)
 end

 def convert_to_english
   zip_characters_together.map do |letter|
     @english_alphabet[letter]
   end
 end

 def english_result
   result = convert_to_english
 end




end
