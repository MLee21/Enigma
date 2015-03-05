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

  def rot_a
    key_generate[0..1].join.to_i
  end

  def rot_b
   key_generate[1..2].join.to_i
  end

  def rot_c
    key_generate[2..3].join.to_i
  end

  def rot_d
    key_generate[3..4].join.to_i
  end
end
  #chunk the first two - start over - move over one,
  #chunk the next two, etc. -> push into new array




