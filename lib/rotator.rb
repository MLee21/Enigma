require_relative '../lib/off_set_calculator'
require_relative '../lib/keys'

require 'pry'

class Rotator

CHARACTER_MAP = [*('a'..'z'),*(0..9),' ','.',','] 

  def initialize
    @key = Keys.new
    @off_set = OffSetCalculator.new
  end

  def character_map
    map = [*('a'..'z'),*(0..9),' ','.',','] 
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

  def move_forward(letter,final_rotation)
    move_letter_forward = final_rotation + CHARACTER_MAP.index(letter)
    new_position = character_map[move_letter_forward % 39] 
    new_position 
  end
end


