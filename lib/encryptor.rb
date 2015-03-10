require_relative '../lib/rotator'
require_relative '../lib/keys'
require_relative '../lib/off_set_calculator'

class Encryptor
    # Encrypt message in file and create encrypted file
    # with encrypted message

  attr_accessor :read_message, :filename, :encrypt, :encrypted_message, :encrypted_file

  def initialize(filename = ARGV.first, encrypted_file = ARGV[1])
    @filename = filename
    @encrypted_file = encrypted_file
    @read_message = File.read(filename)
    @rotator = Rotator.new
    @offset = OffSetCalculator.new
    @encrypt_file = File.open(encrypted_file, 'w')
    @encrypted_message = @encrypt_file.write(encrypt)
  end

  def read_file
    @read_message
  end

  def write_encrypted_file
    @encrypted_message
  end

  def encrypt
    @rotator.move_forward(read_message).join("")
  end
end

encrypt = Encryptor.new
encrypt.read_message
encrypt.encrypted_message
# ("/Users/MinnieLee/Turing/1Module/Enigma/lib/test.txt") 