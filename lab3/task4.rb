require_relative "players_data"

shortest_players = PLAYERS.min_by(3) do |name, _position|
  name.length
end.to_h

# shortest_players = PLAYERS
#   .sort_by { |name, _position| name.length }
#   .first(3)
#   .to_h

puts "Три гравці з найкоротшими іменами:"

shortest_players.each do |name, position|
  puts "#{name}: #{position} (довжина імені: #{name.length})"
end