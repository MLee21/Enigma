class Parser

  def initialize(filename)
    @filename = filename
    @message = File.read(@filename)
  end                     

  def file_reader
    @message
  end
end  

parse = Parser.new("/Users/MinnieLee/Turing/1Module/Enigma/lib/message.txt")  # => #<Encryptor:0x007ff45384ebb8>