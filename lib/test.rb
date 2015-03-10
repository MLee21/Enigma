require 'pry'  # => true

letters = ".0.n h".chars                                # => [".", "0", ".", "n", " ", "h"]
@rotation = [57, 9, 72, 9]                              # => [57, 9, 72, 9]
b = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]  # => ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
cmap = [*('a'..'z'),*(b)," ",".",","]                   # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
# count = letters.count / 4                               # => 2
# final_rotation  = rotation * (count + 1)
 i=0                                                    # => 0
 while i < letters.size - 4                             # => true, true, false
  @rotation << @rotation[i]                             # => [57, 9, 72, 9, 57], [57, 9, 72, 9, 57, 9]
  i+=1                                                  # => 1, 2
 end                                                    # => nil
 puts @rotation                                         # => nil
  results = letters.map do |letter|                     # => [".", "0", ".", "n", " ", "h"]
    cmap.index(letter)                                  # => 37, 26, 37, 13, 36, 7
  end                                                   # => [37, 26, 37, 13, 36, 7]

results.zip(@rotation).map do |pair|  # => [[37, 57], [26, 9], [37, 72], [13, 9], [36, 57], [7, 9]]
  position = pair.inject(:-)          # => -20, 17, -35, 4, -21, -2
  if position < 0                     # => true, false, true, false, true, true
    position += 39                    # => 19, 4, 18, 37
  # elsif
  #   position                          # => 17, 4
  end                                 # => 19, nil, 4, nil, 18, 37
  cmap[position]                      # => "t", "r", "e", "e", "s", "."
end                                   # => ["t", "r", "e", "e", "s", "."]

# >> 57
# >> 9
# >> 72
# >> 9
# >> 57
# >> 9



  


