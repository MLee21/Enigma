gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/off_set_calculator'

class OffSetCalculatorTest < MiniTest::Test
  attr_reader :calculator

  def test_it_runs
    assert OffSetCalculator.new
  end

  def setup
    @calculator = OffSetCalculator.new
  end

  def test_it_formats_the_date_correctly
    assert_equal "030315", calculator.formatted_date
  end

  def test_it_squares_the_number_form_of_date
    assert_equal ["9", "1", "8", "9", "9", "9", "2", "2", "5"], calculator.square_the_formatted_date
  end

  def test_it_outputs_last_four_digits
    assert_equal [9,2,2,5], calculator.take_last_four_digits
  end

  #This will be tests with key rotations 

  def test_the_first_digit_of_off_set_is_added_to_rotation_A

  end

  def test_the_second_digit_of_off_set_is_added_to_rotation_B


  end

  def test_the_third__of_off_set_is_added_to_rotation_C

  end

  def test_the_fourth_of_off_set_is_added_to_rotation_d


  end
end