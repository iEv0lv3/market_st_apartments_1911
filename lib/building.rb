class Building
  attr_accessor :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    rent_prices = []
    @units.each do |unit|
      rent_prices << unit.monthly_rent
    end
    rent_prices.sum.to_f / rent_prices.length.to_f
  end

  def renter_with_highest_rent
    sorted = @units.sort_by do |unit|
      unit.monthly_rent
    end
    sorted.delete_if { |unit| unit.renter == nil}
    sorted.last
  end

  def annual_breakdown
    breakdown = {}
    @units.each do |unit|
      if unit.renter != nil
        annual = unit.monthly_rent * 12
        breakdown[unit.renter.name] = annual
      end
    end
    breakdown
  end
end
