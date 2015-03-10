require_relative '../lib/off_set_calculator'
require_relative '../lib/keys'

require 'pry'

class Rotator

  attr_accessor :key, :results, :off_set, :character_map, :current_rotations

  def initialize
    @key = Keys.new
    @off_set = OffSetCalculator.new
    @character_map = [*('a'..'z'),*(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"] ),' ','.',',']
  end

  def final_rotations
    puts "Created 'encrypted.txt' with the key #{@key.key.join} and date #{@off_set.date}" 
    keys = @key.all_rotations
    offsets = @off_set.take_last_four_digits
    keys.zip(offsets).map.with_index {|index| index.reduce(:+)}
  end 

  def split_characters(letters)
    letters.chars.map do |letter|
       @character_map.index(letter) 
    end
  end

  def move_forward(letters)
    @current_rotations = final_rotations
    i = 0
      until i == letters.size - 4
        @current_rotations << @current_rotations[i]
          i += 1
      end
    results = split_characters(letters)
    results.zip(@current_rotations).map do |pair| 
      position = pair.inject(:+) % 39
      @character_map[position] 
    end
  end

  def convert_key_for_decrypt(key)
    results = key.to_s.scan(/\d/).map {|i| i.to_i}
      results.map do |number|
      c = results.shift(1)
      d = results.shift(1)
      results << [c,d].flatten.join.to_i
      results = d + results
      results[4]
    end
  end

  def move_backward(letters, key)
    rot_key = convert_key_for_decrypt(key)
    @current_rotations = rot_key.zip(@off_set.take_last_four_digits).map {|index| index.reduce(:+)}
    i = 0
    until i == letters.size - 4
      @current_rotations << @current_rotations[i]
        i += 1 
    end
    results = split_characters(letters) 
    results.zip(@current_rotations).map do |pair| 
      position = pair.reduce(:-) 
        if position < 0 
          position += 39 
        end
      @character_map[position] 
    end
  end
end










                                                               

