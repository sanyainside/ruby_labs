# Початкове визначення методу
def greet(name = "Гість")
  "Привіт, #{name}!"
end

puts "До перевизначення:"
puts greet
puts greet("Олександр")

# Перевизначення методу з тією самою назвою
def greet(name = "Гравець")
  "Вітаю в команді, #{name}!"
end

puts "\nПісля перевизначення:"
puts greet
puts greet("Олександр")