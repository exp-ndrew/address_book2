require './lib/address_book'

def main_menu
  puts "Press 'a' to add a contact"
  puts "Press 'l' to list all contacts"
  puts "Press 'v' to choose a contact and see all properties"
  puts "Press 'x' to exit"
  choice = gets.chomp
  if choice == 'a'
    add_contact
  elsif choice == 'l'
    list_contacts
  elsif choice == 'v'
    contact_values
  elsif choice == "x"
    puts "Bye!"
    exit
  else
    puts "Not a valid choice\n\n"
    main_menu
  end
end

def add_contact
  puts "Enter a name"
  name = gets.chomp
  puts "Enter a phone number"
  phone = gets.chomp
  puts "Enter an email"
  email = gets.chomp
  puts "Enter an address"
  address = gets.chomp
  new_contact = Contact.new(name)
  new_contact.add_phone({phon})
  new_contact.save
  puts "\n\n"
  main_menu
end

def list_contacts
  puts "-----"
  Contact.all.each do |con|
    puts con.name
  end
  puts "-----"
  main_menu
end

def contact_values
  Contact.all.each do |con|
    puts con.name
  end
  puts "Choose a contact:"
  contact_chosen = gets.chomp
  Contact.all.each do |con|
    if con.name == contact_chosen
      puts "P:#{con.phone}, E:#{con.email}, A:#{con.address}"
    end
  end
  main_menu
end

main_menu
