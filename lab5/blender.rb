require_relative "kitchen_appliance"

class Blender < KitchenAppliance
  def initialize(brand:, power:)
    super(name: "Блендер", brand: brand, power: power)
  end

  def blend
    ensure_turned_on!
    "#{brand}: блендер подрібнює та змішує продукти."
  end

  def info
    "#{super}; призначення: подрібнення та змішування"
  end

  def operate
    blend
  end
end