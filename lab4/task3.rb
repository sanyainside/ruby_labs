def adult?(age)
  age >= 18
end

def eligible_player?(age, rating)
  adult?(age) && rating >= 60
end

puts "Перевірка віку:"
puts "17 років: #{adult?(17)}"
puts "18 років: #{adult?(18)}"
puts "20 років: #{adult?(20)}"

puts "\nПеревірка допуску гравця:"
puts "Вік 20, рейтинг 75: #{eligible_player?(20, 75)}"
puts "Вік 17, рейтинг 75: #{eligible_player?(17, 75)}"
puts "Вік 20, рейтинг 50: #{eligible_player?(20, 50)}"
puts "Вік 18, рейтинг 60: #{eligible_player?(18, 60)}"