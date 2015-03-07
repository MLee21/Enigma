class Keys

  attr_accessor :generate

  def initialize(generate = key_generate)
    @generate = generate
  end

  def key_generate
    key = (0..9).to_a
    key_multiply = key * 5
    key_multiply.shuffle.take(5)
  end

  def all_rotations
    key_rotations = key_generate
    key_rotations.map do |number|                
    c = key_rotations.shift(1)                
    d = key_rotations.shift(1)                 
    key_rotations << [c, d].flatten.join.to_i  
    key_rotations = d + key_rotations           
    key_rotations[4]                           
    end                                        
  end
end





