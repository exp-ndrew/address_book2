require 'rspec'
require 'address_book'
require 'phone'
require 'email'
require 'address'

describe Contact do
  before do
    Contact.clear
  end

  it 'is initialized with a name, phone, email, address' do
    test_contact = Contact.new('Bob')
    expect(test_contact).to be_an_instance_of Contact
  end

  it 'lets you read the name out' do
    test_contact = Contact.new('Bob')
    expect(test_contact.name).to eq 'Bob'
  end

  it 'lets you read the phone out' do
    test_contact = Contact.new('Bob')
    test_contact.add_phone({:phone => "123-4567", :type => "Home"})
    test_contact.add_phone({:phone => "234-5678", :type => "Office"})
    expect(test_contact.phone[0].type).to eq "Home"
  end

  it 'lets you read the email out' do
    test_contact = Contact.new('Bob')
    test_contact.add_email({email: "bob@bob.com", type: "Personal"})
    expect(test_contact.email[0].email).to eq "bob@bob.com"
  end

  it 'lets you read the address out' do
    test_contact = Contact.new('Bob')
    test_contact.add_address({street: "1234 Main St", city: "Portland", state: "OR", zip: 97215})
    expect(test_contact.address[0].street).to eq "1234 Main St"
  end

  describe '.all' do
    it 'is empty at first' do
      expect(Contact.all).to eq []
    end

    describe '#save' do
      it 'adds a task to the array of saved contacts' do
        test_contact = Contact.new('Bob')
        test_contact.save
        another_contact = Contact.new('Barb')
        another_contact.save
        expect(Contact.all).to eq [test_contact, another_contact]
      end
    end

    describe '.clear' do
      it 'empties out all of the saved contacts' do
        Contact.new('Bob').save
        Contact.clear
        expect(Contact.all).to eq []
      end
    end
  end
end



