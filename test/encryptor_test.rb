require 'simplecov'
SimpleCov.start
gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/parser'
require_relative '../lib/encryptor'


class EncryptorTest < MiniTest::Test

  def test_it_exists
    assert Encryptor.new
  end

  def test_it_encrypts_a_four_character_word_with_correct_rotations_and_offsets
    assert 
  end












end