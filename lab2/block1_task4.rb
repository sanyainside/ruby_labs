numbers = [10, 20, 30, 40, 50, 60, 70]

# while та if
even_positions = []
odd_positions = []
index = 0

while index < numbers.length
  if (index + 1) % 2 == 0
    even_positions << numbers[index]
  else
    odd_positions << numbers[index]
  end

  index += 1
end

result_loop = even_positions + odd_positions

# ітератори partition та map
even_indices, odd_indices = numbers.each_index.partition do |index|
  (index + 1).even?
end

result_iterator = (even_indices + odd_indices).map do |index|
  numbers[index]
end

puts "Початковий масив: #{numbers}"
puts "Спосіб 1 (while): #{result_loop}"
puts "Спосіб 2 (partition + map): #{result_iterator}"