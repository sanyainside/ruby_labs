def transform_number(number, &block)
  return number unless block

  block.call(number)
end

square = transform_number(5) { |value| value**2 }

doubled = transform_number(5) do |value|
  value * 2
end

unchanged = transform_number(5)

puts "Квадрат числа: #{square}"
puts "Подвоєне число: #{doubled}"
puts "Без блоку: #{unchanged}"