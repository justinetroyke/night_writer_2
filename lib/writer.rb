class Writer

  attr_reader :braille_message,
              :line1,
              :line2,
              :line3,
              :output_braille

  def initialize(braille_message)
    @braille_message = braille_message
    @line1 = ''
    @line2 = ''
    @line3 = ''
  end

  def write_braille
    @braille_message.each_slice(3) do |letter|
      @line1 << letter[0]
      @line2 << letter[1]
      @line3 << letter[2]
    end
    @output_braille = ""
    while @line1.length > 0
      output_braille << @line1.slice!(0..79) << "\n"
      output_braille << @line2.slice!(0..79) << "\n"
      output_braille << @line3.slice!(0..79) << "\n"
    end
  @output_braille
  end
end
