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
    @calculator = OffSetCalculator.new("030415")
  end

  def test_it_formats_the_date_correctly
    assert_equal "030415", calculator.date 
  end

  def test_it_defaults_to_current_date
    calculator2 = OffSetCalculator.new
    assert_equal Time.now.strftime("%m%d%y"), calculator2.date
  end

  def test_it_squares_the_number_of_date
    assert_equal ["9", "2", "5", "0", "7", "2", "2", "2", "5"], calculator.square_the_formatted_date
  end

  def test_it_outputs_last_four_digits
    assert_equal [2, 2, 2, 5], calculator.take_last_four_digits
  end

  def test_it_will_split_out_the_four_digits_to_match_with_off_set_a
    assert_equal 2, calculator.off_set_for_rotation_a
  end

  def test_it_will_split_out_the_four_digits_to_match_with_off_set_b
    assert_equal 2, calculator.off_set_for_rotation_b
  end

  def test_it_will_split_out_the_four_digits_to_match_with_off_set_c
    assert_equal 2, calculator.off_set_for_rotation_c
  end

  def test_it_will_split_out_the_four_digits_to_match_with_off_set_d
    assert_equal 5, calculator.off_set_for_rotation_d
  end
end

