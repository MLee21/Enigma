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
    @key = Keys.new
  end
  
  def test_it_exists
    assert Keys.new
  end

  def test_it_generates_a_five_digit_key
    assert_equal key.generate.length, 5
  end

  def test_rotation_A_will_return_first_index_of_array
    key.stub :key_generate, [4,6,3,8,9] do
      assert_equal 46, key.all_rotations[0]
    end
  end

  def test_rotation_A_will_return_zero_and_digit
    key.stub :key_generate, [0,1,2,3,4] do
      assert_equal 01, key.all_rotations[0]
    end
  end

  def test_rotation_A_will_return_zero_and_zero
    key.stub :key_generate, [0,0,0,0,0] do
      assert_equal 00, key.all_rotations[0]
    end
  end

  def test_second_and_third_digits_equals_rotation_b
    key.stub :key_generate, [6,5,7,9,8] do
      assert_equal 57, key.all_rotations[1]
    end 
    key.stub :key_generate, [6,5,7,9,8] do
      refute_equal 65, key.all_rotations[1]
    end
  end

  def test_third_and_fourth_digits_equals_rotation_c
    key.stub :key_generate, [3,6,4,2,4] do
      assert_equal 42, key.all_rotations[2]
    end
  end

  def test_fourth_and_fifth_digits_equals_rotation_d
    key.stub :key_generate, [5,1,2,3,0] do
      assert_equal 30, key.all_rotations[3]
    end
  end

  def test_fourth_and_fifth_digits_if_zeros
    key.stub :key_generate, [3,3,3,0,0] do
      assert_equal [33,33,30,00], key.all_rotations
    end
  end

  def test_method_will_return_all_rotations_in_one_chunk
    key.stub :key_generate, [3,4,5,6,7] do
      assert_equal [34,45,56,67], key.all_rotations
    end
  end
end