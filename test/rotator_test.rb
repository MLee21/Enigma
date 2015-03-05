require 'simplecov'
SimpleCov.start
gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/rotator'
require_relative '../lib/keys'
require_relative '../lib/off_set_calculator'

class RotatorTest < MiniTest::Test

  attr_reader :rotation, :key, :calc, :map

  def setup
    @key = Keys.new
    @calc = OffSetCalculator.new
    @rotation = Rotator.new
  end

  def test_it_exists
    assert Rotator.new
  end

  def test_character_map_includes_lowercase_letters
    ('a'..'z').each do |letter|
      assert rotation.character_map.include?(letter)
    end
  end

  def test_character_map_includes_integers
    (0..9).each do |number|
      assert rotation.character_map.include?(number)
    end
  end

  def test_character_map_includes_three_misc_characters
    [" ",",","."].each do |character|
      assert rotation.character_map.include?(character)
    end
  end

  def test_the_first_digit_of_off_set_is_added_to_rotation_a
        key.stub :key_generate, [3,2,4,5,6] do
          assert_equal 32, key.rot_a
        calc.stub :off_set_for_rotation_a, 9 do
          assert_equal 9, calc.off_set_for_rotation_a
        rotation.stub :add_rot_a_to_off_set, 41 do
          assert_equal 41, rotation.add_rot_a_to_off_set
        end
      end
    end
  end

  def test_the_second_digit_of_off_set_is_added_to_rotation_b
        key.stub :key_generate, [0,0,5,3,2] do
          assert_equal 05, key.rot_b
        calc.stub :off_set_for_rotation_b, 5 do
          assert_equal 5, calc.off_set_for_rotation_b
        rotation.stub :add_rot_b_to_off_set, 10 do
          assert_equal 10, rotation.add_rot_b_to_off_set
        end
      end
    end   
  end

  def test_the_third__of_off_set_is_added_to_rotation_c
        key.stub :key_generate, [0,3,5,0,9] do
          assert_equal 50, key.rot_c 
        calc.stub :off_set_for_rotation_c, 0 do
          assert_equal 0, calc.off_set_for_rotation_c
        rotation.stub :add_rot_c_to_off_set, 50 do
          assert_equal 50, rotation.add_rot_c_to_off_set
        end
      end
    end
  end

  def test_the_fourth_of_off_set_is_added_to_rotation_d
        key.stub :key_generate, [0,0,3,0,0] do
          assert_equal 00, key.rot_d 
        calc.stub :off_set_for_rotation_d, 8 do
          assert_equal 8, calc.off_set_for_rotation_d
        rotation.stub :add_rot_d_to_off_set, 8 do
          assert_equal 8, rotation.add_rot_d_to_off_set
        end
      end
    end
  end

  def test_it_will_move_a_letter_forward
        key.stub :key_generate, [4,5,3,7,8] do 
          assert_equal 45, key.rot_a 
        calc.stub :off_set_for_rotation_a, 9 do
          assert_equal 9, calc.off_set_for_rotation_a
        rotation.stub :add_rot_a_to_off_set, 54 do
          assert_equal 54, rotation.add_rot_a_to_off_set
          assert_equal "p", rotation.move_forward("a",54)
        end
      end
    end
  end

  def test_it_will_move_a_different_letter_forward
        key.stub :key_generate, [4,5,3,7,8] do 
          assert_equal 45, key.rot_a 
        calc.stub :off_set_for_rotation_a, 9 do
          assert_equal 9, calc.off_set_for_rotation_a
        rotation.stub :add_rot_a_to_off_set, 54 do
          assert_equal 54, rotation.add_rot_a_to_off_set
          assert_equal "v", rotation.move_forward("g",54)
        end
      end
    end
  end

   def test_it_will_move_a_letter_forward
        key.stub :key_generate, [0,0,3,0,0] do 
          assert_equal 03, key.rot_b
        calc.stub :off_set_for_rotation_a, 5 do
          assert_equal 5, calc.off_set_for_rotation_a
        rotation.stub :add_rot_a_to_off_set, 8 do
          assert_equal 8, rotation.add_rot_a_to_off_set
          assert_equal "i", rotation.move_forward("a",8)
        end
      end
    end
  end
end
