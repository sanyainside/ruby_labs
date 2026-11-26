require_relative "kitchen_appliance"

class Multicooker < KitchenAppliance
  def initialize(brand:, power:)
    super(name: "Мультиварка", brand: brand, power: power)
  end

  def cook
    ensure_turned_on!
    "#{brand}: мультиварка готує страву."
  end

  def info
    "#{super}; призначення: приготування страв"
  end

  def operate
    cook
  end
end