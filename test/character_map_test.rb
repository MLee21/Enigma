gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/character_map'

class CharacterMapTest < MiniTest::Test

attr_reader :map

  def test_it_runs
    assert CharacterMap.new
  end

  def setup
    @map = CharacterMap.new
  end

  def test_character_map_includes_lowercase_letters
    ('a'..'z').each do |letter|
      assert map.character_map.include?(letter)
    end
  end

  def test_character_map_includes_integers
    (0..9).each do |number|
      assert map.character_map.include?(number)
    end
  end

  def test_character_map_includes_three_misc_characters
    [" ",",","."].each do |character|
      assert map.character_map.include?(character)
    end
  end
end