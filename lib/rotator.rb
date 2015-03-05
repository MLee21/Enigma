
require_relative '../lib/off_set_calculator'
require_relative '../lib/keys'
require_relative '../lib/character_map'

require 'pry'

class Rotator

  def initialize
    @key = Keys.new
    @off_set = OffSetCalculator.new
  end

  def add_rot_a_to_off_set
    @key.rot_a + @off_set.off_set_for_rotation_a  
  end

  def add_rot_b_to_off_set
    @key.rot_b + @off_set.off_set_for_rotation_b
  end

  def add_rot_c_to_off_set
    @key.rot_c + @off_set.off_set_for_rotation_c
  end

  def add_rot_d_to_off_set
    @key.rot_d + @off_set.off_set_for_rotation_d
  end
end

