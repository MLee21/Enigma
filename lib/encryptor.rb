require_relative 'keys'
require_relative 'off_set_calculator'
require_relative 'character_map'

class Encryptor

  def initialize
    @off_set = OffSetCalculator.new
    @key = Keys.new
  end


  def add_rot_a_to_off_set
    off_set_a = @key.rot_a 
  end











end