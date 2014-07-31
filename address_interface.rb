require './lib/address_book'

@current_contact = nil

def main_menu

  if Contact.all == []
    puts "Please add a contact.\n\n\n\n"
  else
    puts "Contact List \n\n\n\n"
    Contact.all.each_with_index do |contact, i|
      puts "#{(i+1)}. #{contact.name}" #include @phone.length, @email.length, etc
    end
    puts "Enter a contact's number to view or modify."
    choice = gets.chomp
    #use choice to refer to index
  end
  puts "Press 'a' to add a contact"
  puts "Press 'x' to exit"
  choice = gets.chomp
  if choice == 'a'
    add_contact
  elsif choice == "x"
    puts "Bye!"
    exit
  else
    puts "Not a valid choice\n\n"
    main_menu
  end
end

def add_contact
  puts "Enter the contact's name"
  contact_name = gets.chomp
  new_contact = Contact.new(contact_name)
  new_contact.save
  @current_contact = new_contact
  puts "Contact #{new_contact.name} created!"
  contact_view
end

def contact_view
  system("clear")
  puts "#{@current_contact.name}\n"
  unless @current_contact.address == []
    @current_contact.address.each do |address|
      puts "#{address.street}\n#{address.city}, #{address.state} #{address.zip}\n
      ---------\n"
    end
  end
  unless @current_contact.phone == []
    @current_contact.phone.each do |phone|
      puts "#{phone.type}: #{phone.phone_number}\n"
    end
  end
  unless @email == []
    @current_contact.email.each do |email|
      puts "#{email.type}: #{email.email}\n"
    end
  end
  puts "\n\n"
  puts "Enter 'a' to add an address to Andrew."
  puts "Enter 'e' to add an email to Andrew."
  puts "Enter 'p' to add a phone to Andrew."
  puts "\n"
  puts "Enter 'c' to change info"
  puts "Enter 'd' to delete info"

end

main_menu
