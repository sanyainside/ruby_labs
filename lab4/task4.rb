class Score
  def initialize(points)
    @points = points
  end

  def points
    @points
  end

  def points=(new_points)
    @points = new_points
  end

  def +(other)
    Score.new(points + other.points)
  end

  def ==(other)
    other.is_a?(Score) && points == other.points
  end
end

first = Score.new(10)
second = Score.new(15)

puts "Перший рахунок: #{first.points}"
puts "Другий рахунок: #{second.points}"

total = first + second
puts "Сума рахунків: #{total.points}"

puts "Рахунки рівні до зміни: #{first == second}"

first.points = 15

puts "Перший рахунок після присвоювання: #{first.points}"
puts "Рахунки рівні після зміни: #{first == second}"