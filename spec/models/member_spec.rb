require 'rails_helper'

RSpec.describe Member, type: :model do

	before(:each) do
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
end
