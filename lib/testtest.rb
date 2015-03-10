array = []                                    # => []
x = 12345                                     # => 12345
results = x.to_s.scan(/\d/).map {|i| i.to_i}  # => [1, 2, 3, 4, 5]
results.map.each_cons(2) do |number|          # => #<Enumerator: [1, 2, 3, 4, 5]:map>
  array << number                             # => [[1, 2]], [[1, 2], [2, 3]], [[1, 2], [2, 3], [3, 4]], [[1, 2], [2, 3], [3, 4], [4, 5]]
end                                           # => nil
numbers = array                               # => [[1, 2], [2, 3], [3, 4], [4, 5]]