require 'rails_helper'

RSpec.describe Member, type: :model do

	before(:each) do
	  	@member =Member.create();
	end 		

    context 'validation tests' do
	  	it 'ensures first name presence' do 
	  		member=Member.new(lastname: 'last',email: 'scanc07@gmail.com', mobile_no: '9975573222', password: 'Scanc07').save
	  		expect(member).to eql(true)
	  	end

	  	it 'ensures last name presence' do 
	  		member=Member.new(firstname: 'last',email: 'scanc07@gmail.com', mobile_no: '9975573222', password: 'Scanc07').save
	  		expect(member).to eql(true)
	    end

	    it 'is invalid without a firstname' do 
	  		member=Member.create(firstname: '', lastname: 'first',email: 'scanc07@gmail.com', mobile_no: '9975573222', password: 'Scanc07')
	  		member.save
	  		expect(member).to be_valid
	    end

	    it 'ensures valid email input' do 
	  		@member.email="scanc07@gmail"
	  		expect(member.email).to match(/\A[a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9]+(\.[a-z0-9]+)*(\.[a-z]{2,3})\z/)
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

	    it 'contains valid email input' do 
	    	member=Member.create()
	  		member.email="scanc07@gmail.com"
	  		expect(member.email).to match(/\A[a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9]+(\.[a-z0-9]+)*(\.[a-z]{2,3})\z/)
	    end

		it 'contain valid mobile number input' do 
			member=Member.create()
	  		member.mobile_no="99755732222"
	  		expect(member.mobile_no).to match(/\A[0-9]{10}\z/)
	    end
	end
end
