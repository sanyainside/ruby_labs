def player_info(name:, age: nil, city: "Невідомо")
  age_text = age.nil? ? "не вказано" : age

  "Ім'я: #{name}; вік: #{age_text}; місто: #{city}"
end

puts "Лише обов'язковий параметр:"
puts player_info(name: "Олександр")

puts "\nІм'я та вік:"
puts player_info(name: "Олександр", age: 20)

puts "\nУсі параметри в іншому порядку:"
puts player_info(city: "Яремче", name: "Олександр", age: 20)