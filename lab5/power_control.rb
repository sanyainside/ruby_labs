module PowerControl
  def turn_on
    @turned_on = true
    "#{name}: прилад увімкнено."
  end

  def turn_off
    @turned_on = false
    "#{name}: прилад вимкнено."
  end

  def turned_on?
    @turned_on == true
  end

  private

  def ensure_turned_on!
    unless turned_on?
      raise RuntimeError, "Спочатку увімкніть прилад: #{name}."
    end
  end
end