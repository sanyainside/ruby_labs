numbers = Array.new(10) { rand(-10..10) }

updated_numbers = numbers.map do |number|
  number < 0 ? -1 : number
end

puts "Початковий масив: #{numbers}"
puts "Змінений масив: #{updated_numbers}"