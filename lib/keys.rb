require 'pry'

class Keys

  attr_accessor :key


  def initialize(key =  key_generate)
    @key = key
  end

  def key_generate
    random_key = (0..9).to_a
    key_multiply = random_key * 5
    key_multiply.shuffle.take(5)
  end

  def all_rotations
    @key.map do |number|                
      c = @key.shift(1)                
      d = @key.shift(1)                 
      @key << [c, d].flatten.join.to_i  
      @key = d + @key          
      @key[4]                      
    end
  end
end







