require 'simplecov'
SimpleCov.start 
gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/keys'

class KeysTest < MiniTest::Test

attr_reader :key

  def setup
    @key = Keys.new([1,2,3,4,5])
  end
  
  def test_it_exists
    assert Keys.new
  end

  def test_it_generates_a_five_digit_key
    assert_equal key.key_generate.length, 5
  end

  def test_rotation_a_will_return_first_index_of_array
    assert_equal 12, key.all_rotations[0]
  end

  def test_second_and_third_digits_equals_rotation_b
      assert_equal 23, key.all_rotations[1]
    end 

  def test_third_and_fourth_digits_equals_rotation_c
      assert_equal 34, key.all_rotations[2]
  end

  def test_fourth_and_fifth_digits_equals_rotation_d
      assert_equal 45, key.all_rotations[3]
  end

  def test_method_will_return_all_rotations_in_one_chunk
      assert_equal [12,23,34,45], key.all_rotations
  end
end