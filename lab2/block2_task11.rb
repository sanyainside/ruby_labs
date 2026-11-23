matrix = [
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9, 10, 11, 12],
  [13, 14, 15, 16]
]

# цикл while
sum_loop = 0
index = 0

while index < matrix.length
  sum_loop += matrix[index][index]
  index += 1
end

average_loop = sum_loop.to_f / matrix.length

# each_with_index, map та sum
diagonal = matrix.each_with_index.map do |row, index|
  row[index]
end

sum_iterator = diagonal.sum
average_iterator = sum_iterator.to_f / diagonal.length

puts "Матриця:"
matrix.each { |row| p row }

puts "Головна діагональ: #{diagonal}"

puts "Спосіб 1 (while):"
puts "Сума: #{sum_loop}; середнє: #{average_loop}"

puts "Спосіб 2 (each_with_index + sum):"
puts "Сума: #{sum_iterator}; середнє: #{average_iterator}"