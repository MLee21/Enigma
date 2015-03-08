require 'simplecov'
SimpleCov.start
gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/parser'

class ParserTest < MiniTest::Test

  attr_accessor :file_path

  def setup
    self.file_path = File.expand_path'../../lib/test.txt',__FILE__
    @parse = Parser.new(file_path)
  end

  def test_runs
    assert Parser.new(file_path)
  end

  def test_it_can_read_a_file
    assert_equal "do i dare disturb the universe.", @parse.read_file
  end

  def test_it_can_read_two_lines_from_a_file
    assert_equal "do i dare disturb the universe.", @parse.read_file
  end
end