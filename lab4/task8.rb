def run_without_argument
  return "Блок не передано" unless block_given?

  yield
end

def run_with_argument(number)
  return number unless block_given?

  yield(number)
end

message = run_without_argument do
  "Привіт із блоку!"
end

square = run_with_argument(5) do |value|
  value**2
end

puts "Блок без аргументу: #{message}"
puts "Блок з аргументом: #{square}"
puts "Перший метод без блоку: #{run_without_argument}"
puts "Другий метод без блоку: #{run_with_argument(5)}"