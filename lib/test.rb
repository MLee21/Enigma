require 'pry'  # => true

letters = "dh 4c1".chars                                # => ["d", "h", " ", "4", "c", "1"]
@rotation = [23, 68, 71, 104]                           # => [23, 68, 71, 104]
b = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]  # => ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
cmap = [*('a'..'z'),*(b)," ",".",","]                   # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
# count = letters.count / 4                               # => 2
# final_rotation  = rotation * (count + 1)
 i=0                                                    # => 0
 while i < letters.size - 4                             # => true, true, false
  @rotation << @rotation[i]                             # => [23, 68, 71, 104, 23], [23, 68, 71, 104, 23, 68]
    i+=1                                                  # => 1, 2
 end                                                    # => nil                                        # => nil
  results = letters.map do |letter|                     # => ["d", "h", " ", "4", "c", "1"]
    cmap.index(letter)                                  # => 3, 7, 36, 30, 2, 27
  end                                                   # => [3, 7, 36, 30, 2, 27]

results.zip(@rotation).map do |pair|  # => [[3, 23], [7, 68], [36, 71], [30, 104], [2, 23], [27, 68]]
  position = pair.inject(:-)          # => -20, -61, -35, -74, -21, -41
  if position < 0                     # => true, true, true, true, true, true
    position += 39                    # => 19, -22, 4, -35, 18, -2
  # elsif
  #   position                          # => 17, 4
  end                                 # => 19, -22, 4, -35, 18, -2
  cmap[position]                      # => "t", "r", "e", "e", "s", "."
end                                   # => ["t", "r", "e", "e", "s", "."]

# >> 23
# >> 68
# >> 71
# >> 104
# >> 23
# >> 68



  


