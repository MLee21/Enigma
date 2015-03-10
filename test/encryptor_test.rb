gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/encryptor'
require_relative '../lib/rotator'


class EncryptorTest < MiniTest::Test
  extend MiniTest::Spec::DSL

  attr_accessor :file_path, :encrypted_file, :filename

  def setup
    self.file_path = File.expand_path'../../lib/test.txt',__FILE__
    @encrypt = Encryptor.new(file_path)
  end

  def test_runs
    assert Encryptor.new(file_path)
  end

  # def test_it_can_read_a_file
  #   assert_equal "do i dare disturb the universe.", @encrypt.read_file
  # end

end