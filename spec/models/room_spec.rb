require 'rails_helper'

RSpec.describe Room, type: :model do
  
  subject{described_class.reflect_on_association(ascc_name)}
  subject(:hotel) { Hotel.new(name: 'Sundar',location: '244, rasta peth',description: 'Luxury hotel with play ground', rating: '2.1', state: 'Gujarat', city: 'Ahmedabad') }
  subject(:room) { described_class.new(price: "121", no_of_bedroom: 2,description: 'Luxury room with tv', hotel_id: 1) }
  
  context "Associations" do
    it "belongs to hotel" do
      assc = described_class.reflect_on_association(:hotel)
      expect(assc.macro).to eq :belongs_to
    end

    it "has many images" do
      assc = described_class.reflect_on_association(:images)
      expect(assc.macro).to eq :has_many
    end

    it "has many bookings" do
      assc = described_class.reflect_on_association(:bookings)
      expect(assc.macro).to eq :has_and_belongs_to_many
    end    
  end


  context 'Validation' do

    it "is valid with all valid attributes" do
      hotel.save
      room.save
      expect(subject).to be_valid
    end
end
=begin
    it "is not valid without a price" do
      subject.price = nil
      subject.save      
      expect(subject.errors.messages[:price][0]).to eql("can't be blank")
    end

    it "is not valid when firstname contain digits" do
      subject.name = 234
      subject.save      
      expect(subject.errors.messages[:name][0]).to eql("Name does not contain special characters and digits")
    end

    it "is not valid when firstname contain special character" do
      subject.name = '*%'
      subject.save      
      expect(subject.errors.messages[:name][0]).to eql("Name does not contain special characters and digits")
    end

    it "is not valid when location is empty" do
      subject.location = nil
      subject.save
      expect(subject.errors.messages[:location][0]).to eql("it should have proper Location details")
    end

    it "is not valid when state is empty" do
      subject.state = nil
      subject.save
      expect(subject.errors.messages[:state][0]).to eql("can't be blank")
    end

    it "is not valid when city is empty" do
      subject.city = nil
      subject.save
      expect(subject.errors.messages[:city][0]).to eql("can't be blank")
    end        
  end
end
=end
end
