class Address

  attr_accessor :street, :city, :state, :zip

  def initialize(attributes)
    @street = attributes[:street]
    @city = attributes[:city]
    @state = attributes[:state]
    @zip = attributes[:zip]
  end

end
