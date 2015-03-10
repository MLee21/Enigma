gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/encryptor'
require_relative '../lib/rotator'


class EncryptorTest < MiniTest::Test

  attr_accessor :file_path, :encrypted_file, :filename

  def setup
    self.file_path = File.expand_path'../../lib/test.txt',__FILE__
    filename = 'test.txt'
    encrypted_file = 'encrypted.txt'
    @encrypt = Encryptor.new(file_path,encrypted_file)
  end

  def test_runs
    assert Encryptor.new(file_path, 'encrypted.txt')
  end

  def test_it_can_read_a_file
    assert_equal "do you even lift, bro.", @encrypt.read_message
  end

  def test_it_can_encrypt_a_file_with_the_correct_length_of_characters
    assert_equal 22, @encrypt.encrypted_message
  end
end