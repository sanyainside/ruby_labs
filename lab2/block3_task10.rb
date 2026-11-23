template_path = File.join(__dir__, "template.html")
copy_path = File.join(__dir__, "template_copy.html")

# Зберігаємо початковий вміст для другого способу
original_content = File.read(template_path)
File.write(copy_path, original_content)

# Спосіб 1: File.read + gsub + File.write
File.write(template_path, File.read(template_path).gsub("{{YEAR}}", "2026"))

puts "Спосіб 1 (File.read + File.write):"
puts File.read(template_path)

# Спосіб 2: блокова форма File.open
File.open(copy_path, "r+") do |file|
  updated_content = file.read.gsub("{{YEAR}}", "2026")

  file.rewind
  file.write(updated_content)
  file.truncate(file.pos)
end

puts "\nСпосіб 2 (File.open):"
puts File.read(copy_path)