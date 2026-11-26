require_relative "kitchen_appliance"

class CoffeeMaker < KitchenAppliance
  def initialize(brand:, power:)
    super(name: "Кавоварка", brand: brand, power: power)
  end

  def brew_coffee
    ensure_turned_on!
    "#{brand}: кавоварка готує каву."
  end

  def info
    "#{super}; призначення: приготування кави"
  end

  def operate
    brew_coffee
  end
end