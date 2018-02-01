require 'rails_helper'

RSpec.describe Member, type: :model do

=begin  before(:each) do
 	@member =Member.create();
  end 		

  context 'validation tests' do
    it 'ensures first name presence' do 
	  member = Member.new(lastname: 'last',email: 'scanc07@gmail.com', mobile_no: '9975573222', password: 'Scanc07').save
	  expect(member).to eql(false)
	end

	it 'ensures last name presence' do 
	  member=Member.new(firstname: 'last',email: 'scanc07@gmail.com', mobile_no: '9975573222', password: 'Scanc07').save
	  expect(member).to eql(false)
	end

	it 'ensures valid mobile number input' do
	  @member.mobile_no="997554"
	  expect(member.mobile_no).to match(/\A[0-9]{10}\z/)
	end

    it 'ensures mobile number presence' do 
  		member=Member.new(firstname: 'last',email: 'scanc07@gmail.com',lastname: 'first', password: 'Scanc07').save
  		expect(member).to eql(false)
    end

    it 'should save successfully' do 
  		member=Member.new(firstname: 'last',lastname: 'first',email: 'scanc07@gmail.com', mobile_no: '9975573222', password: 'Scanc07').save
  		expect(member).to eql(true)
    end
  end
=end
  #let(:member){ Member.create()}
  subject { described_class.new(firstname: 'last',lastname: 'first',email: 'scanc07@gmail.com', mobile_no: '9975573222', password: 'Scanc07') }

  context 'Validation' do
  	name_regex=/\A[a-z][a-zA-Z]+\z/

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a firstname" do
      subject.firstname = nil
      subject.save      
      expect(subject.errors.messages[:firstname][0]).to eql("can't be blank")
    end

    it "is not valid when firstname contains digits" do
      subject.firstname = 123
      subject.save
      expect(subject.errors.messages[:firstname][0]).to eql("contains only alphabets")
    end

    it "is not valid without a lastname" do
      subject.lastname = nil
      subject.save
      expect(subject.errors.messages[:lastname][0]).to eql("can't be blank")
    end

    it "is not valid when lastname contains digits" do
      subject.lastname = 123
      subject.save
      #puts subject.errors.messages[:lastname]
      expect(subject.errors.messages[:lastname][0]).to eql("contains only alphabets")
  	end

    it "is not valid without an email" do
      subject.email = nil
      subject.save
      expect(subject.errors.messages[:email][0]).to eql("can't be blank")
    end

    it "is not valid when it is not in proper format" do
      subject.email = 'sacssd'
      subject.save
      expect(subject.errors.messages[:email][0]).to eql("is invalid")
    end

    it "is not valid without a mobile" do
      subject.mobile_no = nil
      subject.save
      expect(subject.errors.messages[:mobile_no][0]).to eql("can't be blank")
    end

    it "is not valid when mobile number is of not 10digits" do
      subject.mobile_no = 454545
      subject.save
      expect(subject.errors.messages[:mobile_no][0]).to eql("is invalid")
    end

    it "is not valid without a password" do
      subject.password = nil
      subject.save
      expect(subject.errors.messages[:password][0]).to eql("can't be blank")
    end

    it "is not valid when email input is improper" do
      subject.email="Scanc07"
      subject.save
      expect(subject.errors.messages[:email][0]).to eql("is invalid")
    end

    it "is valid with an proper email input" do
      subject.email = "scanc@gmail.com"
      subject.save
      expect(subject.errors.messages[:email][0]).to eql(nil)
    end    

    it "is valid with an proper email input" do
      subject.email = "scanc@"
      #puts assert_raises(Exception) { subject.save! }
      lambda { subject.save! }.should raise_error

	  #assert_equal( "Email is invalid", exception.message )           
    end
  end

end
