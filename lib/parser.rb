class Parser

  def initialize(filename)
    @filename = filename
    @message = File.read(@filename)
  end                     

  def read_file
    @message
  end
end  

# parse = Parser.new("/Users/MinnieLee/Turing/1Module/Enigma/lib/test.txt") 
# puts parse.read_file