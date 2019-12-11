require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/building'
require './lib/renter'

class BuildingTest < Minitest::Test
  def test_building_exists
    building = Building.new

    assert_instance_of Building, building
  end

  def test_building_starts_with_no_units_in_array
    building = Building.new

    assert_equal [], building.units
  end

  def test_building_can_add_units
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building = Building.new

    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_same unit1, building.units[0]
    assert_same unit2, building.units[1]
  end

  def test_average_monthly_rents_for_building
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building = Building.new

    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal 1099.5, building.average_rent
  end

  def test_building_renter_with_highest_rent
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 3, bedrooms: 2})

    renter1 = Renter.new("Spencer")

    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)
    unit2.add_renter(renter1)

    assert_same unit2, building.renter_with_highest_rent

    renter3 = Renter.new('Max')
    unit3.add_renter(renter3)

    assert_same unit3, building.renter_with_highest_rent
  end

  def test_building_annual_breakdown
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 3, bedrooms: 2})

    renter1 = Renter.new("Spencer")
    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)
    unit2.add_renter(renter1)
    renter2 = Renter.new("Jessie")
    unit1.add_renter(renter2)

    assert building.annual_breakdown
  end
end
