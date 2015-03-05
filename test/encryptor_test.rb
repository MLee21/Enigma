require 'simplecov'
SimpleCov.start
gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/rotator'
require_relative '../lib/keys'
require_relative '../lib/off_set_calculator'
require_relative '../lib/encryptor'

class EncryptorTest < MiniTest::Test

  attr_accessor :file_path

  def setup
    self.file_path = File.expand_path'../../lib/message.txt',__FILE__
    @encrypt = Encryptor.new(file_path)
  end

  def test_runs
    assert Encryptor.new(file_path)
  end

  def test_it_can_read_a_file
    assert_equal "tree", @encrypt.message
  end









end