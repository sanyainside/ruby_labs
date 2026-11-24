def greet(name)
  "Привіт, #{name}!"
end

alias welcome greet

puts "Початкові виклики:"
puts greet("Олександр")
puts welcome("Олександр")

def greet(name)
  "Вітаю в команді, #{name}!"
end

puts "\nПісля перевизначення greet:"
puts greet("Олександр")
puts welcome("Олександр")