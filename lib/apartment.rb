class Apartment
  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms
  attr_accessor :renter

  def initialize(number: '', monthly_rent: '', bathrooms: '', bedrooms: '')
    @number = number
    @monthly_rent = monthly_rent
    @bathrooms = bathrooms
    @bedrooms = bedrooms
    @renter = nil
  end

  def add_renter(renter)
    @renter = renter
  end
end
