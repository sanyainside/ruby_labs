file_path = ARGV[0] || File.join(__dir__, "sample.pdf")

abort "Файл не знайдено: #{file_path}" unless File.file?(file_path)

bytes = File.open(file_path, "rb") do |file|
  file.read(8) || "".b
end

hex = bytes.unpack1("H*")

# Спосіб 1: перевірка HEX через if/elsif
type_if =
  if hex.start_with?("89504e470d0a1a0a")
    "PNG"
  elsif hex.start_with?("ffd8ff")
    "JPEG"
  elsif hex.start_with?("255044462d")
    "PDF"
  else
    "Невідомий тип"
  end

# Спосіб 2: пошук бінарної сигнатури через find
signatures = {
  "PNG" => "\x89PNG\r\n\x1A\n".b,
  "JPEG" => "\xFF\xD8\xFF".b,
  "PDF" => "%PDF-".b
}

match = signatures.find do |_type, signature|
  bytes.start_with?(signature)
end

type_iterator = match ? match.first : "Невідомий тип"

puts "Файл: #{File.basename(file_path)}"
puts "Перші байти (HEX): #{hex}"
puts "Спосіб 1 (if/elsif): #{type_if}"
puts "Спосіб 2 (find): #{type_iterator}"