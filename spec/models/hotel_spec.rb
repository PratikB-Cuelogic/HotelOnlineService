require 'rails_helper'

RSpec.describe Hotel, type: :model do

  subject{ described_class.reflect_on_association(ascc_name) }
  subject { described_class.new(name: 'Sundar', location: '244, rasta peth', description: 'Luxury hotel with play ground', rating: '2.1', state: 'Gujarat', city: 'Ahmedabad') }

  context 'Associations' do
    it 'has many rooms' do
      assc = described_class.reflect_on_association(:rooms)
      expect(assc.macro).to eq :has_many
    end

    it 'has many images' do
      assc = described_class.reflect_on_association(:images)
      expect(assc.macro).to eq :has_many
    end
  end

  context 'Validation' do
    it 'is valid with all valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a Hotel name' do
      subject.name = nil
      subject.save      
      expect(subject.errors.messages[:name][0]).to eql("it should have proper hotel name")
    end

    it 'is not valid when firstname contain digits' do
      subject.name = 234
      subject.save      
      expect(subject.errors.messages[:name][0]).to eql("Name does not contain special characters and digits")
    end

    it 'is not valid when firstname contain special character' do
      subject.name = '*%'
      subject.save      
      expect(subject.errors.messages[:name][0]).to eql("Name does not contain special characters and digits")
    end

    it 'is not valid when location is empty' do
      subject.location = nil
      subject.save
      expect(subject.errors.messages[:location][0]).to eql("it should have proper Location details")
    end

    it 'is not valid when state is empty' do
      subject.state = nil
      subject.save
      expect(subject.errors.messages[:state][0]).to eql("can't be blank")
    end

    it 'is not valid when city is empty' do
      subject.city = nil
      subject.save
      expect(subject.errors.messages[:city][0]).to eql("can't be blank")
    end        
  end
end
