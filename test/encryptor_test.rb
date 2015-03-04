gem "minitest"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/encryptor'
require_relative '../lib/keys'
require_relative '../lib/off_set_calculator'

class EncryptorTest < MiniTest::Test

  attr_reader :encryption

  def setup
    @encryption = Encryptor.new
    @key = Keys.new
    @calc = OffSetCalculator.new
  end

  def test_it_exists
    assert Encryptor.new
  end

  def test_the_first_digit_of_off_set_is_added_to_rotation_a
    skip
     key.stub, :key_generator, [3,6,3,7,4] 
     calc.stub :take_last_four_digits, [9,2,2,5] 
      assert_equal 45, encryption.add_rot_a_to_off_set
    end
  end

  # def test_the_second_digit_of_off_set_is_added_to_rotation_b
  #   skip

  # end

  # def test_the_third__of_off_set_is_added_to_rotation_c
  #   skip
  # end

  # def test_the_fourth_of_off_set_is_added_to_rotation_d
  #   skip

  # end
end