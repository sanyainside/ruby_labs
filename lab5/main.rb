require_relative "blender"
require_relative "coffee_maker"
require_relative "multicooker"

blender = Blender.new(brand: "Bosch", power: 800)
coffee_maker = CoffeeMaker.new(brand: "DeLonghi", power: 1450)
multicooker = Multicooker.new(brand: "Philips", power: 1000)

puts "Перевірка роботи вимкненого приладу:"

begin
  puts blender.operate
rescue RuntimeError => error
  puts error.message
end

puts "\nРобота всіх приладів:"

appliances = [blender, coffee_maker, multicooker]

appliances.each do |appliance|
  puts appliance.info
  puts "Увімкнений: #{appliance.turned_on?}"

  puts appliance.turn_on
  puts appliance.operate
  puts appliance.turn_off

  puts "Увімкнений: #{appliance.turned_on?}"
  puts
end

puts "\nПеревизначення методу для одного об’єкта:"

def blender.operate
  "#{super} Додатково працює турборежим."
end

puts "\nБлендер з особливим режимом:"
puts blender.turn_on
puts blender.operate
puts blender.turn_off

ordinary_blender = Blender.new(
  brand: "Bosch",
  power: 800
)

puts "\nІнший блендер того самого класу:"
puts ordinary_blender.turn_on
puts ordinary_blender.operate
puts ordinary_blender.turn_off

puts "\nПеревірка геттерів і сеттерів:"

puts "Назва: #{blender.name}"
puts "Бренд до зміни: #{blender.brand}"
puts "Потужність до зміни: #{blender.power} Вт"

blender.brand = "Bosch Pro"
blender.power = 1000

puts "\nПісля зміни через сеттери:"
puts blender.info

puts "\nСпроба встановити від’ємну потужність:"

begin
  blender.power = -100
rescue ArgumentError => error
  puts "Помилка: #{error.message}"
end

puts "Потужність після невдалої зміни: #{blender.power} Вт"