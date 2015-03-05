class Encryptor

  def initialize(filename)
    @filename = filename
    @message = File.read(@filename)     # => "\"tree\""
  end                       # => nil

  def message
    @message
  end
end  # => nil

encrypt = Encryptor.new("/Users/MinnieLee/Turing/1Module/Enigma/lib/message.txt")  # => #<Encryptor:0x007ff45384ebb8>