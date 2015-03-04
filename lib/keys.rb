class Keys

  attr_accessor :generate

  def initialize(generate = key_generator)
    @generate = generate
  end

  def key_generator
    key = (0..9).to_a
    key_multiply = key * 5
    key_multiply.shuffle.take(5)
  end

  def rot_a
    rotation_a = key_generator[0..1].join.to_i
  end

  def rot_b
    rotation_b = key_generator[1..2].join.to_i
  end

  def rot_c
    rotation_c = key_generator[2..3].join.to_i
  end

  def rot_d
    rotation_d = key_generator[3..4].join.to_i
  end
end