require_relative "players_data"

indexed_players = PLAYERS.to_a

puts "Тип даних: #{indexed_players.class}"
puts "Кількість елементів: #{indexed_players.size}"

indexed_players.each_with_index do |player, index|
  puts "#{index}: #{player}"
end

# indexed_players = PLAYERS.map { |name, position| [name, position] }