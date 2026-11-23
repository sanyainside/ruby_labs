numbers = [-3, -2, -1, 0, 1, 2, 3]

# sum із блоком
result_sum = numbers.sum { |number| number**2 }

# map + reduce
result_map_reduce = numbers.map { |number| number**2 }.reduce(0, :+)

puts "Початковий масив: #{numbers}"
puts "Спосіб 1 (sum): #{result_sum}"
puts "Спосіб 2 (map + reduce): #{result_map_reduce}"