require 'rails_helper'

RSpec.describe Member, type: :model do

  subject { described_class.new(firstname: 'last',lastname: 'first',email: 'scanc07@gmail.com', mobile_no: '9975573222', password: 'Scanc07') }

  context 'Validation' do
  	name_regex=/\A[a-z][a-zA-Z]+\z/

    it "is valid with all valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a firstname" do
      subject.firstname = nil
      subject.save      
      expect(subject.errors.messages[:firstname][0]).to eql("can't be blank")
    end

    it "is not valid when firstname is small than 3characters" do
      subject.firstname = 'ss'
      subject.save      
      expect(subject.errors.messages[:firstname][0]).to eql("is too short (minimum is 3 characters)")
    end

    it "is not valid when firstname contains more than 20characters" do
      subject.firstname = 'sssssssssssssssssssssssssssssssssssssssssssssssssssssss'
      subject.save      
      expect(subject.errors.messages[:firstname][0]).to eql("is too long (maximum is 20 characters)")
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

    it "is valid with a proper mobile number input" do
      subject.mobile_no = 9975573222
      subject.save
      expect(subject.errors.messages[:mobile_no][0]).to eql(nil)
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
  end

  context 'Exception' do
    it "raised when email input is invalid" do
     subject.email = "scanc@"
      #puts assert_raises(Exception) { subject.save! }
      expect {raise subject.save! }.to raise_error(ActiveRecord::RecordInvalid ,'Validation failed: Email is invalid')
    end  	
  end

end
