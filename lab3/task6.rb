require_relative "players_data"

print "Введіть ім'я гравця: "
name = gets.to_s.strip

abort "Ім'я не може бути порожнім." if name.empty?

if PLAYERS.key?(name)
  puts "Гравця #{name} знайдено."
  puts "Позиція: #{PLAYERS[name]}"
else
  puts "Гравця #{name} немає в команді."  # puts PLAYERS.fetch(name, "Гравця не знайдено")
end