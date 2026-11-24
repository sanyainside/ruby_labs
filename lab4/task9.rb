without_arguments = Proc.new { "Привіт із Proc!" }

with_argument = Proc.new do |value|
  value.inspect
end

puts "Proc без параметрів: #{without_arguments.call}"
puts "Зайвий аргумент: #{without_arguments.call(100)}"

puts "Один аргумент: #{with_argument.call(5)}"
puts "Пропущений аргумент: #{with_argument.call}"
puts "Зайві аргументи: #{with_argument.call(5, 10, 15)}"

def proc_return_example
  action = Proc.new do
    return "Вихід із методу через Proc"
  end

  action.call

  "Звичайне завершення методу"
end

puts "return у Proc: #{proc_return_example}"

def create_return_proc
  Proc.new { return "Результат Proc" }
end

saved_proc = create_return_proc

begin
  saved_proc.call
rescue LocalJumpError => error
  puts "Proc після завершення методу: #{error.class}"
end