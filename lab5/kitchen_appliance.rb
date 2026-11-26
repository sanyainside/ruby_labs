require_relative "power_control"

class KitchenAppliance
  include PowerControl
  attr_reader :name, :power
  attr_accessor :brand

  def initialize(name:, brand:, power:)
    @name = name
    @brand = brand
    self.power = power
    @turned_on = false
  end

  def power=(value)
    unless value.is_a?(Integer) && value.positive?
      raise ArgumentError, "Потужність має бути додатним цілим числом."
    end

    @power = value
  end

  def info
    "#{brand} #{name}: #{power} Вт"
  end
end