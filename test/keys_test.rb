gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/keys'

class KeysTest < MiniTest::Test

attr_reader :key

  def setup
    @key = Keys.new([3,4,5,6,7])
  end
  
  def test_it_exists
    assert Keys.new
  end

  def test_it_generates_a_five_digit_key
    assert_equal key.generate.length, 5
  end

  def test_rotation_A_will_return_first_two_digits_of_key
    assert_equal 34, key.rot_a
  end

  def test_rotation_A_will_return_first_two_digits_of_key
    key.stub :key_generate, [4,6,3,8,9] do
      assert_equal 46, key.rot_a
    end
  end

  def test_rotation_A_will_return_zero_and_digit
    key.stub :key_generate, [0,1,2,3,4] do
      assert_equal 01, key.rot_a
    end
  end

  def test_rotation_A_will_return_zero_and_zero
    key.stub :key_generate, [0,0,0,0,0] do
      assert_equal 00, key.rot_a
    end
  end

  def test_second_and_third_digits_equals_rotation_B
    key.stub :key_generate, [6,5,7,9,8] do
      assert_equal 57, key.rot_b
    end 
  end

  def test_third_and_fourth_digits_equals_rotation_C
    key.stub :key_generate, [3,6,4,2,4] do
      assert_equal 42, key.rot_c
    end
  end

  def test_fourth_and_fifth_digits_equals_rotation_D
    key.stub :key_generate, [5,1,2,3,0] do
      assert_equal 30, key.rot_d
    end
  end

  def test_fourth_and_fifth_digits_if_zeros
    key.stub :key_generate, [3,3,3,0,0] do
      assert_equal 00, key.rot_d
    end
  end
end