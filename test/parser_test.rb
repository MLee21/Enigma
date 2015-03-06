require 'simplecov'
SimpleCov.start
gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/rotator'
require_relative '../lib/keys'
require_relative '../lib/off_set_calculator'
require_relative '../lib/parser'

class ParserTest < MiniTest::Test

  attr_accessor :file_path

  def setup
    self.file_path = File.expand_path'../../lib/message.txt',__FILE__
    @parse = Parser.new(file_path)
  end

  def test_runs
    assert Parser.new(file_path)
  end

  def test_it_can_read_a_file
    assert_equal "tree.\nflower.", @parse.file_reader
  end

  def test_it_can_read_two_lines_from_a_file
    assert_equal "tree.\nflower.", @parse.file_reader
  end



end