require_relative "players_data"

total_players = PLAYERS.size

puts "Загальна кількість гравців у команді: #{total_players}"

# Альтернативний варіант:
# total_players = 0

# PLAYERS.each_key do |_name|
#   total_players += 1
# end