require_relative "players_data"

nonzero_ratings = PLAYER_RATINGS.reject do |_name, rating|
  rating.zero?
end

lowest_rated_players = nonzero_ratings.min_by(5) do |_name, rating|
  rating
end.to_h

# lowest_rated_players = nonzero_ratings
#   .sort_by { |_name, rating| rating }
#   .first(5)
#   .to_h

puts "П'ять гравців із найнижчими ненульовими рейтингами:"

lowest_rated_players.each do |name, rating|
  puts "#{name}: #{PLAYERS[name]}, рейтинг: #{rating}"
end
