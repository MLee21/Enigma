require_relative '../lib/rotator'
require_relative '../lib/keys'
require_relative '../lib/off_set_calculator'


class Decryptor

  attr_accessor :read_message, :decrypted_message, :decrypted_file, :key, :offset

  def initialize(filename = ARGV.first, decrypted_file = ARGV[1], key = ARGV[2])
    @filename = filename
    @decrypted_file = decrypted_file
    @read_message = File.read(filename)
    @rotator = Rotator.new
    @offset = OffSetCalculator.new
    @decrypt_file = File.open(decrypted_file, 'w')
    @decrypted_message = @decrypt_file.write(decrypt) 
  end

  def decrypt
    puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{@offset.date}"
    @rotator.move_backward(read_message, ARGV[2])
  end
end

decrypted = Decryptor.new
decrypted.read_message
decrypted.decrypted_message
