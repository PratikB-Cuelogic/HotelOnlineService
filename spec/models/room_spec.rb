require 'rails_helper'

RSpec.describe Room, type: :model do
  
  subject(:hotel) { Hotel.create(name: 'Sundar',location: '244, rasta peth',description: 'Luxury hotel with play ground', rating: '2.1', state: 'Gujarat', city: 'Ahmedabad') }
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
      room.hotel_id= hotel.id
      room.save
      expect(room).to be_valid
    end

    it "is not valid without a price" do
      room.price = nil
      room.save      
      expect(room.errors.messages[:price][0]).to eql("can't be blank")
    end

    it "is not valid if value of price is less than 0" do
      room.price = 0.8
      room.save      
      expect(room.errors.messages[:price][0]).to eql("should be between 1 and 99999.")
    end

    it "is not valid if value of price is greater than 99999" do
      room.price = 999991
      room.save      
      expect(room.errors.messages[:price][0]).to eql("should be between 1 and 99999.")
    end    

    it "is not valid if no. of bedrooms is nil" do
      room.no_of_bedroom = nil
      room.save      
      expect(room.errors.messages[:no_of_bedroom][0]).to eql("can't be blank")
    end 
  end
end
