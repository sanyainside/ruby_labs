def sum_array(numbers)
  numbers.sum
end

def sum_arguments(*numbers)
  numbers.sum
end

numbers = [10, 20, 30]

puts "Початковий масив: #{numbers}"
puts "Масив як один аргумент: #{sum_array(numbers)}"
puts "Порожній масив: #{sum_array([])}"
puts "Окремі аргументи: #{sum_arguments(10, 20, 30)}"
puts "Розпакований масив: #{sum_arguments(*numbers)}"