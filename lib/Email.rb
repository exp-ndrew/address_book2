class Email

  attr_accessor :email, :type

  def initialize (attributes)
    @email = attributes[:email]
    @type = attributes[:type]
  end
end
