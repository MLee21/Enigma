require_relative '../lib/parser' 

class Encryptor
    # Encrypt message in file and create encrypted file
    # with encrypted message

  def initialize
    @message =  Parser.new("test.txt")

message_filename = ARGV[0] || "test.txt" 
encrypted_message_filename = ARGV[1] || "encrypted.txt"

message = Parser.new("test.txt")

encrypted_message = Encryptor.new  
encrypted_file = encrypted_message.encrypt("41521","020315", message)

File.open(encrypted_message_filename, "w") { |file| file.write(encrypted_file) }













  end