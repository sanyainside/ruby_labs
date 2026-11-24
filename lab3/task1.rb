require_relative "players_data"

players = PLAYERS.dup

puts "Тип даних: #{players.class}"
puts "Кількість гравців: #{players.size}"
puts "Гравці команди:"

players.each do |name, position|
  puts "#{name}: #{position}"
end

# Можна записувати гравців вручну через Hash.new але такий спосіб не зручний
# players = Hash.new

# players["Олександр"] = "Воротар"
# players["Андрій"] = "Захисник"
# players["Олег"] = "Нападник"
# ...

# puts "Тип даних: #{players.class}"
# puts "Кількість гравців: #{players.size}"
# puts "Гравці команди:"

# players.each do |name, position|
#   puts "#{name}: #{position}"
# end