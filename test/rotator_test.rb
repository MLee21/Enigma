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
        key.stub :all_rotations, [67,36,57,62] do
          assert_equal [67,36,57,62], key.all_rotations
        calc.stub :take_last_four_digits, [8,5,4,1] do
          assert_equal [8,5,4,1] , calc.take_last_four_digits
        rotation.stub :final_rotations, [75,41,61,63] do
          assert_equal [75,41,61,63], rotation.final_rotations
        end
      end
    end
  end

  def test_the_second_digit_of_off_set_is_added_to_rotation_b
        key.stub :all_rotations, [45,67,32,41] do
          assert_equal [45,67,32,41], key.all_rotations
        calc.stub :take_last_four_digits, [7,6,9,3] do
          assert_equal [7,6,9,3], calc.take_last_four_digits
        rotation.stub :final_rotations, [52,73,41,44] do
          assert_equal [52,73,41,44], rotation.final_rotations
        end
      end
    end   
  end

  def test_the_third__of_off_set_is_added_to_rotation_c
        key.stub :all_rotations, [12,87,45,9] do
          assert_equal [12,87,45,9], key.all_rotations
        calc.stub :take_last_four_digits, [0,3,2,6] do
          assert_equal [0,3,2,6], calc.take_last_four_digits
        rotation.stub :final_rotations, [12,90,47,15] do
          assert_equal [12,90,47,15], rotation.final_rotations
        end
      end
    end
  end

  def test_the_fourth_of_off_set_is_added_to_rotation_d
        key.stub :all_rotations, [45,67,23,12] do
          assert_equal [45,67,23,12], key.all_rotations
        calc.stub :take_last_four_digits, [4,2,3,1] do
          assert_equal [4,2,3,1], calc.take_last_four_digits
        rotation.stub :final_rotations, [49,69,26,13] do
          assert_equal [49,69,26,13], rotation.final_rotations
        end
      end
    end
  end

  def test_it_will_move_a_letter_forward
          key.stub :all_rotations, [23,43,56,98] do
            assert_equal [23,43,56,98], key.all_rotations
          calc.stub :take_last_four_digits, [4,2,3,1] do
            assert_equal [4,2,3,1], calc.take_last_four_digits
          rotation.stub :final_rotations, [27,45,59,99] do
            assert_equal [27,45,59,99], rotation.final_rotations
        end
      end
    end
  end

  def test_it_will_move_a_different_letter_forward
        key.stub :all_rotations, [00,00,00,00] do
            assert_equal [00,00,00,00], key.all_rotations
          calc.stub :take_last_four_digits, [2,4,6,5] do
            assert_equal [2,4,6,5], calc.take_last_four_digits
          rotation.stub :final_rotations, [2,4,6,5] do
            assert_equal [2,4,6,5], rotation.final_rotations
        end
      end
    end
  end

   def test_it_will_add_rotations_and_offsets
          key.stub :all_rotations, [12,50,22,00] do
            assert_equal [12,50,22,00], key.all_rotations
          calc.stub :take_last_four_digits, [9,2,2,5] do
            assert_equal [9,2,2,5], calc.take_last_four_digits
          rotation.stub :final_rotations, [21,52,24,5] do
            assert_equal [21,52,24,5], rotation.final_rotations
        end
      end
    end
  end

  def test_it_will_add_rotations_to_correct_off_sets
          key.stub :all_rotations, [00,03,30,00] do
            assert_equal [00,03,30,00], key.all_rotations
          calc.stub :take_last_four_digits, [9,2,2,5] do
            assert_equal [9,2,2,5], calc.take_last_four_digits
          rotation.stub :final_rotations, [9,5,32,5] do
            assert_equal [9,5,32,5], rotation.final_rotations
        end
      end
    end
  end

  def test_it_will_move_letters_forward_in_map    
      rotation.stub :final_rotations, [50,17,54,26] do
        assert_equal [50,17,54,26], rotation.final_rotations
      rotation.stub :move_forward, "2.ql" do
        assert_equal "2.ql", rotation.move_forward("ruby")
      end
    end
  end

  def test_it_will_move_other_letters_forward_in_map
      rotation.stub :final_rotations, [50,17,54,26] do
        assert_equal [50,17,54,26], rotation.final_rotations
      rotation.stub :move_forward, "48t4" do
        assert_equal "48t4", rotation.move_forward("tree")
      end
    end       
  end
end

