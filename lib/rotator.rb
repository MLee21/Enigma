require_relative '../lib/off_set_calculator'  
require_relative '../lib/keys'               

require 'pry'  

class Rotator

  attr_reader :key, :off_set, :final_rotations  

b = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
CHARACTER_MAP = [*('a'..'z'),*(b),' ','.',',']  

  def initialize
    @key = Keys.new
    @off_set = OffSetCalculator.new
    @final_rotations = [] 
  end                                

  def character_map
    b = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    map = [*('a'..'z'),*(0..9),' ','.',','] 
  end                                      

  def final_rotations
    keys = @key.all_rotations
    offsets = @off_set.take_last_four_digits
    keys.zip(offsets).map.with_index {|index| index.reduce(:+)}
  end                                                           

  def move_forward(letters)
    count = letters.size / 4
    rotation = final_rotations * (count + 1)
    results = letters.chars.map do |letter|
      CHARACTER_MAP.index(letter)
    end
    results.zip(rotation).map do |pair|
      position = pair.reduce(:+) % 39
      CHARACTER_MAP[position]
    end
  end

  def move_backward(letters)
    count = letters.size / 4
    rotation = final_rotations * (count + 1)
    results = letters.chars.map do |letter|
      CHARACTER_MAP.index(letter)
    end
    results.zip(rotation).map do |pair|
      position = pair.reduce(:-) % 39
      CHARACTER_MAP[position]
    end
  end
end






                                                               

