require 'rails_helper'

RSpec.describe BookService do	
	describe 'by user' do
	  context 'when the user is logged in,' do
	    context 'and the room is available' do
		    it 'return a booking details' do
		    end
		end
  		context 'and when the room is not available' do
	  	  it 'returns nil' do
	  	  end
	    end	    		
	  end
	  context 'when the user is not logged in' do
	    it 'should notify the user to log in first' do
	    end
	  end		  
	end
end