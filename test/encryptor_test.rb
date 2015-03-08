gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/parser'
require_relative '../lib/encryptor'
require_relative '../lib/rotator'


class EncryptorTest < MiniTest::Test

  attr_accessor :file_path, :filename, :encrypt, :rotation, :created_file

  def setup
    self.file_path = File.expand_path'../../lib/test.txt',__FILE__
    @encrypt = Encryptor.new(file_path,created_file)
    @rotation = Rotator.new
  end

  def test_it_exists
    assert Encryptor.new(file_path,created_file)
  end

  def test_it_can_read_the_message_before_encrypting
    skip
    assert_equal "do i dare disturb the universe.", @encrypt.read_message
  end

  def test_it_can_encrypt_the_message
    skip
      encrypt.stub :encrypt, "ozitiot3452mi4spi5yt6p23pj" do 
      assert_equal "ozitiot3452mi4spi5yt6p23pj", encrypt.encrypt("do i dare disturb the universe.")
    end
  end
end