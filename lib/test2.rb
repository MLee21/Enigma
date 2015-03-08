letters = "ruby".chars                                                                 # => ["r", "u", "b", "y"]
final_rotation = [50,17,54,26]                                                         # => [50, 17, 54, 26]
cmap = [*('a'..'z'),*(0..9),' ','.',',']                                               # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, " ", ".", ","]
# character_map_values = Hash[cmap.map.with_index.to_a]  # => {"a"=>0, "b"=>1, "c"=>2, "d"=>3, "e"=>4, "f"=>5, "g"=>6, "h"=>7, "i"=>8, "j"=>9, "k"=>10, "l"=>11, "m"=>12, "n"=>13, "o"=>14, "p"=>15, "q"=>16, "r"=>17, "s"=>18, "t"=>19, "u"=>20, "v"=>21, "w"=>22, "x"=>23, "y"=>24, "z"=>25, 0=>26, 1=>27, 2=>28, 3=>29, 4=>30, 5=>31, 6=>32, 7=>33, 8=>34, 9=>35, " "=>36, "."=>37, ","=>38}            # => [12, 23, 34, 45]
  results = letters.map do |letter|                                                    # => ["r", "u", "b", "y"]
    cmap.index(letter)                                                                 # => 17, 20, 1, 24
  end                                                                                  # => [17, 20, 1, 24]
  # if results.length <= 4                                                                        # => false
  new_results = final_rotation.zip(results).map.with_index {|index| index.reduce(:+)}  # => [67, 37, 55, 50]
  new_results.map {|number|cmap[number % 39]}.join("")                                 # => "2.ql"
  # end






  # elsif results.length > 4                                                                      # => true
  # group_by_four = results.each_slice(4).to_a                                                                              # => [[17, 20, 1, 24], [8, 18, 6, 17], [4, 0, 19]]
  # new_results = final_rotation.map.with_index{|index|results.map {|number| number + index }}  # => [[67, 70, 51, 74, 58, 68, 56, 67, 54, 50, 69], [34, 37, 18, 41, 25, 35, 23, 34, 21, 17, 36], [71, 74, 55, 78, 62, 72, 60, 71, 58, 54, 73], [43, 46, 27, 50, 34, 44, 32, 43, 30, 26, 45]]
  # group_by_four.map{|a| a.map{|e| results = final_rotation.map {|number| e + number}}}  # => [[[67, 34, 71, 43], [70, 37, 74, 46], [51, 18, 55, 27], [74, 41, 78, 50]], [[58, 25, 62, 34], [68, 35, 72, 44], [56, 23, 60, 32], [67, 34, 71, 43]], [[54, 21, 58, 30], [50, 17, 54, 26], [69, 36, 73, 45]]]
  # new_results = final_rotation.map.with_index{|index|group_by_four.map{|element|element.map{|inner_element|inner_element + index}}}  # => [[[67, 70, 51, 74], [58, 68, 56, 67], [54, 50, 69]], [[34, 37, 18, 41], [25, 35, 23, 34], [21, 17, 36]], [[71, 74, 55, 78], [62, 72, 60, 71], [58, 54, 73]], [[43, 46, 27, 50], [34, 44, 32, 43], [30, 26, 45]]]
  # new_positions = new_results[0].flatten                                               # ~> NoMethodError: undefined method `[]' for nil:NilClass
  # new_positions.map {|number|cmap[number % 39]}.join("")
  # end                                                                                           # => [[67, 70, 51, 74, 58, 68, 56, 67, 54, 50, 69], [34, 37, 18, 41, 25, 35, 23, 34, 21, 17, 36], [71, 74, 55, 78, 62, 72, 60, 71, 58, 54, 73], [43, 46, 27, 50, 34, 44, 32, 43, 30, 26, 45]]


              






