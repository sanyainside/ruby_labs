without_arguments = lambda { "Привіт із lambda!" }
with_argument = ->(value) { value.inspect }

puts "Lambda без параметрів: #{without_arguments.call}"
puts "Один аргумент: #{with_argument.call(5)}"

begin
  with_argument.call
rescue ArgumentError => error
  puts "Пропущений аргумент: #{error.class}"
end

begin
  with_argument.call(5, 10)
rescue ArgumentError => error
  puts "Зайві аргументи: #{error.class}"
end

begin
  without_arguments.call(100)
rescue ArgumentError => error
  puts "Зайвий аргумент для lambda без параметрів: #{error.class}"
end

def lambda_return_example
  action = lambda do
    return "Вихід тільки з lambda"
  end

  result = action.call

  "#{result}; метод продовжив виконання"
end

puts "return у lambda: #{lambda_return_example}"

def create_return_lambda
  -> { return "Збережена lambda працює" }
end

saved_lambda = create_return_lambda

puts "Після завершення методу: #{saved_lambda.call}"