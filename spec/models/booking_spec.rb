require 'rails_helper'

RSpec.describe Booking, type: :model do
  #subject{described_class.reflect_on_association(ascc_name)}
  subject(:member) { Member.create(firstname: 'last',lastname: 'first',email: 'scanc07@gmail.com', mobile_no: '9975573222', password: 'Scanc07') }  
  subject(:booking) { described_class.new(date: '2018-02-17',checkin: '2018-02-18',checkout: '2018-02-19', member: nil) }
  context "Associations" do
    it "has many rooms" do
      assc = described_class.reflect_on_association(:rooms)
      expect(assc.macro).to eq :has_and_belongs_to_many
    end

    it "belongs to members" do
      assc = described_class.reflect_on_association(:member)
      expect(assc.macro).to eq :belongs_to
    end
  end

  context 'Validation' do

    it "is not valid if member id does not exist" do
      booking.member_id = member.id
	  booking.save    	
      expect(subject).to be_valid
    end

    it "is not valid without a Booking date" do
      subject.date = nil
      subject.save      
      expect(subject.errors.messages[:date][0]).to eql("can't be blank")
    end

    it "is not valid without a Checkin date" do
      subject.checkin = nil
      subject.save      
      expect(subject.errors.messages[:checkin][0]).to eql("can't be blank")
    end

    it "is not valid without a Checkout date" do
      subject.checkout = nil
      subject.save      
      expect(subject.errors.messages[:checkout][0]).to eql("can't be blank")
    end

  end
end
