gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/decryptor'
require_relative '../lib/rotator'
require_relative '../lib/off_set_calculator'



class DecryptorTest < MiniTest::Test

  attr_accessor :file_path

  def setup
    self.file_path = File.expand_path'../../lib/encrypted.txt',__FILE__
    filename = 'encrypted.txt'
    decrypted_file = 'decrypted.txt'
    key = "12345"
    @decrypt = Decryptor.new(file_path, decrypted_file, key)
  end

  # def test_runs
  #   skip
  #   assert Decryptor.new(file_path,'decrypted.txt', "12345")
  # end

  




end



