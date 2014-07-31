class Phone

  attr_accessor :type, :phone_number

  def initialize(attributes)
    @type = attributes[:type]
    @phone_number = attributes[:phone]
  end

end
