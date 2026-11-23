athletes = [
  { name: "Олександр", age: 22, sport: "Tennis" },
  { name: "Влад", age: 21, sport: "Swimming" },
  { name: "Андрій", age: 25, sport: "Tennis" },
  { name: "Катя", age: 24, sport: "Swimming" }
]

# group_by + sum
groups_first = athletes.group_by { |athlete| athlete[:sport] }

puts "Спосіб 1 (group_by + sum):"

groups_first.each do |sport, members|
  total_age = members.sum { |athlete| athlete[:age] }
  average_age = total_age.to_f / members.size
  names = members.map { |athlete| athlete[:name] }.join(", ")

  puts "#{sport}: #{names}; середній вік: #{average_age}"
end

# групування та підсумовування через each
groups_second = {}

athletes.each do |athlete|
  sport = athlete[:sport]
  groups_second[sport] ||= []
  groups_second[sport] << athlete
end

puts "\nСпосіб 2 (each):"

groups_second.each do |sport, members|
  total_age = 0

  members.each do |athlete|
    total_age += athlete[:age]
  end

  average_age = total_age.to_f / members.size
  names = members.map { |athlete| athlete[:name] }.join(", ")

  puts "#{sport}: #{names}; середній вік: #{average_age}"
end