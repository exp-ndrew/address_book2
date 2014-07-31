require './lib/Phone'
require './lib/Email'
require './lib/Address'

class Contact

  @@all_contacts = []

  def initialize(name)
    @name = name
    @phone = []
    @email = []
    @address = []
  end

  attr_accessor :name, :phone, :email, :address

  def add_phone(attributes)
    added_phone = Phone.new(attributes)
    @phone << added_phone
  end

  def add_email (attributes)
    added_email = Email.new(attributes)
    @email << added_email
  end

  def add_address (attributes)
    added_address = Address.new(attributes)
    @address << added_address
  end

  def Contact.all
    @@all_contacts
  end

  def save
    @@all_contacts << self
  end

  def Contact.clear
    @@all_contacts = []
  end
end
