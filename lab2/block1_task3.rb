numbers = [4, 9, -2, 9, 0, 5, 9]

# керуючі конструкції while та if
max_loop = numbers[0]
indices_loop = []
index = 0

while index < numbers.length
  if numbers[index] > max_loop
    max_loop = numbers[index]
    indices_loop = [index]
  elsif numbers[index] == max_loop
    indices_loop << index
  end

  index += 1
end

# max та ітератор each_with_index
max_iterator = numbers.max
indices_iterator = []

numbers.each_with_index do |number, index|
  indices_iterator << index if number == max_iterator
end

puts "Початковий масив: #{numbers}"
puts "Максимальний елемент: #{max_loop}"
puts "Спосіб 1 (while): #{indices_loop}"
puts "Спосіб 2 (each_with_index): #{indices_iterator}"