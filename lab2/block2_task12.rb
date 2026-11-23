matrix = [
  [0, 0, 0],
  [0, 5, 0],
  [0, 0, 0],
  [-1, 0, 0],
  [0, 0, 0]
]

# вкладені цикли while
zero_rows_loop = []
row_index = 0

while row_index < matrix.length
  column_index = 0
  all_zero = true

  while column_index < matrix[row_index].length
    if matrix[row_index][column_index] != 0
      all_zero = false
      break
    end

    column_index += 1
  end

  zero_rows_loop << (row_index + 1) if all_zero
  row_index += 1
end

# each_with_index та all?
zero_rows_iterator = []

matrix.each_with_index do |row, index|
  if row.all? { |number| number == 0 }
    zero_rows_iterator << (index + 1)
  end
end

puts "Матриця:"
matrix.each { |row| p row }

puts "Спосіб 1 (while): #{zero_rows_loop}"
puts "Спосіб 2 (each_with_index + all?): #{zero_rows_iterator}"