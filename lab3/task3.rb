require_relative "players_data"

puts "Оберіть критерій сортування:"
puts "1 — за ім'ям гравця"
puts "2 — за позицією"
print "Ваш вибір: "

choice = gets.to_s.strip

sorted_players =
  case choice
  when "1"
    PLAYERS.sort_by { |name, _position| name }.to_h # PLAYERS.sort { |a, b| a[0] <=> b[0] }.to_h
  when "2"
    PLAYERS.sort_by { |name, position| [position, name] }.to_h  # PLAYERS.sort { |a, b| [a[1], a[0]] <=> [b[1], b[0]] }.to_h
  else
    abort "Неправильний вибір. Потрібно ввести 1 або 2."
  end

puts "\nВідсортований хеш:"

sorted_players.each do |name, position|
  puts "#{name}: #{position}"
end