require_relative '../lib/parser'
require_relative '../lib/rotator'
require_relative '../lib/keys'
require_relative '../lib/off_set_calculator'


class Decryptor

  #takes in the encrypted text
  #decrypts it
  #writes it to a 'decrypted text' file.
  attr_accessor :read_message, :decrypted_message, :decrypted_file, :key, :date

  def initialize(filename = ARGV.first, decrypted_file = ARGV[1], key = ARGV[2], date = ARGV[3])
    @decrypted_file = decrypted_file
    @read_message = Parser.new(filename).read_file
    @rotator = Rotator.new
    @key = Keys.new
    @offset = OffSetCalculator.new
    @decrypt_file = File.open(decrypted_file, 'w')
    @decrypted_mssage = @decrypt_file.write(decrypt) 
  end

  def output_message
    "Created '#{decrypted_file}' with the key #{key} and date #{@offset.date}"
  end

  #using key and date from encrypt, decrypt.
  def decrypt
    @rotator.move_backward(read_message).join("")
  end
end

decrypted = Decryptor.new
puts decrypted.read_message
decrypted.decrypted_message
puts decrypted.output_message