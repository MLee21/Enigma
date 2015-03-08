require_relative '../lib/off_set_calculator'  # => true
require_relative '../lib/keys'                # => true

require 'pry'  # => true

class Rotator

  attr_reader :key, :off_set, :final_rotations  # => nil

CHARACTER_MAP = [*('a'..'z'),*(0..9),' ','.',',']  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, " ", ".", ","]

  def initialize
    @key = Keys.new
    @off_set = OffSetCalculator.new
    @final_rotations = [] 
  end                                # => nil

  def character_map
    map = [*('a'..'z'),*(0..9),' ','.',','] 
  end                                        # => nil

  def final_rotations
    keys = @key.all_rotations
    offsets = @off_set.take_last_four_digits
    keys.zip(offsets).map.with_index {|index| index.reduce(:+)}
  end                                                            # => nil

  def move_forward(letters)
  split_letters = letters.chars
  each_rotation = final_rotations 
  results = split_letters.map do |letter|
    CHARACTER_MAP.index(letter)
  end
  group_by_four = results.each_slice(4).to_a
  grouped = each_rotation.map{|number|group_by_four.map {|element| element.map {|inner_element| inner_element + number }}}
  new_positions = grouped[0].flatten
  new_positions.map {|number|cmap[number % 39]}.join("")                                                                 # => nil
end 
                                                                # => nil


