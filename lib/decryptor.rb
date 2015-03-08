require_relative '../lib/parser'
require_relative '../lib/rotator'
require_relative '../lib/keys'
require_relative '../lib/off_set_calculator'


class Decryptor

  #takes in the encrypted text
  #decrypts it
  #writes it to a 'decrypted text' file.
  attr_accessor :read_message

  def initialize(filename = ARGV.first, decrypted_file = ARGV[1])
    @decrypted_file = decrypted_file
    @read_message = Parser.new(filename).read_file
    @rotator = Rotator.new
    @key = Keys.new
    @offset = OffSetCalculator.new
    @decrypt_file = File.open(decrypted_file, 'w')
    @decrypted_mssage = @decrypt_file.write(decrypt) 
  end

  def output_message
    "Created '#{decrypted_file}' with the key #{@key.key_generate.join} and date #{@offset.date}"
  end

  def decrypt
    @rotator.move_backward(read_message)
  end
end

decrypted = Decryptor.new
puts decrypted.read_message
decrypt.decrypted_message
puts decrypt.output_message