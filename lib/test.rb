require 'pry'  # => true

letters = "ruby is great.".chars                        # => ["r", "u", "b", "y", " ", "i", "s", " ", "g", "r", "e", "a", "t", "."]
# encrypted_letters = [2, ".", "q", "l", "i", "z", 7, "x", "r", 8, "t", 0, 4, "p"]  # => [2, ".", "q", "l", "i", "z", 7, "x", "r", 8, "t", 0, 4, "p"]
rotation = [50,17,54,26]                                # => [50, 17, 54, 26]
b = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]  # => ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
cmap = [*('a'..'z'),*(b),' ','.',',']                   # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
# cmap = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
count = letters.count / 4                               # => 3
final_rotation  = rotation * (count + 1)                # => [50, 17, 54, 26, 50, 17, 54, 26, 50, 17, 54, 26, 50, 17, 54, 26]
  results = letters.map do |letter|                     # => ["r", "u", "b", "y", " ", "i", "s", " ", "g", "r", "e", "a", "t", "."]
    cmap.index(letter)                                  # => 17, 20, 1, 24, 36, 8, 18, 36, 6, 17, 4, 0, 19, 37
  end                                                   # => [17, 20, 1, 24, 36, 8, 18, 36, 6, 17, 4, 0, 19, 37]
results.zip(final_rotation).map do |pair|               # => [[17, 50], [20, 17], [1, 54], [24, 26], [36, 50], [8, 17], [18, 54], [36, 26], [6, 50], [17, 17], [4, 54], [0, 26], [19, 50], [37, 17]]
  position = pair.inject(:-) % 39                       # => 6, 3, 25, 37, 25, 30, 3, 10, 34, 0, 28, 13, 8, 20
  cmap[position]                                        # => "g", "d", "z", ".", "z", "4", "d", "k", "8", "a", "2", "n", "i", "u"
end                                                     # => ["g", "d", "z", ".", "z", "4", "d", "k", "8", "a", "2", "n", "i", "u"]

 
