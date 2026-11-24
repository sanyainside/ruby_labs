require_relative "players_data"

players = PLAYERS.dup

# Тестові випадки відсутньої позиції
players["Андрій"] = nil
players["Влад"] = ""

players.each do |name, position|
  next unless position.to_s.strip.empty?

  loop do
    print "Введіть позицію для #{name}: "
    input = gets

    abort "Введення перервано." if input.nil?

    new_position = input.strip

    if new_position.empty?
      puts "Позиція не може бути порожньою."
      next
    end

    players[name] = new_position
    break
  end
end

puts "\nОновлений хеш гравців:"

players.each do |name, position|
  puts "#{name}: #{position}"
end


# players["Андрій"] = nil
# players["Влад"] = ""

# # Відбираємо гравців без заданої позиції
# missing_positions = players.select do |_name, position|
#   position.to_s.strip.empty?
# end

# # Заповнюємо позиції відібраних гравців
# missing_positions.each_key do |name|
#   loop do
#     print "Гравець #{name}. Введіть позицію: "
#     input = gets

#     abort "Введення перервано." if input.nil?

#     position = input.strip

#     if position.empty?
#       puts "Позиція не може бути порожньою."
#       next
#     end

#     players[name] = position
#     break
#   end
# end

# puts "\nОновлений хеш гравців:"

# players.each do |name, position|
#   puts "#{name}: #{position}"
# end