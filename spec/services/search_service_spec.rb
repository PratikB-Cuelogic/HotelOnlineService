require 'rails_helper'

RSpec.describe SearchService do

  #subject { described_class.new() }

  describe 'by state' do
    context 'when state is present' do
      context 'and when room is available on the given check-in check-out date' do
        it ' returns hotel list' do
          
        end
      end
      context 'and when room is not available on the given check-in check-out date' do
        it 'returns nil' do
        end
      end  	    
  	end
  	context 'when state is not present' do
      it 'returns nil' do
      end  		
  	end
  end

  describe 'by rating' do
    context 'when rating is present' do
      context 'and when the room is available on the given check-in check-out date' do
        it ' returns hotel list' do
        end
      end
      context 'and when room is not available on the given check-in check-out date' do
        it 'returns nil' do
        end
      end  	    
  	end
  	context 'when rating is not present' do
      it 'returns nil' do
      end  		
  	end
  end

  describe 'by hotel name' do
	context 'when hotel name is present' do
      context 'and when room is available on the given check-in check-out date' do
        it 'returns hotel list' do
        end
  	  end
      context 'and when room is not available on the given check-in check-out date' do
        it 'returns nil' do
        end
  	  end  	  	  
    end
    context 'when hotel name is not present' do
    	it 'returns nil' do
    	end
    end
  end

  
  describe 'by price' do
    context 'when price is present' do
	  context 'and when room is available on the given check-in check-out date' do
	    it 'returns room list' do
	    end
	  end
	  context 'and when room is not available on the given check-in check-out date' do
	    it 'returns nil' do
	    end
  	  end
  	end
  	context 'when price is not present' do	    
  	  it 'returns nil' do
	  end 
  	end
  end


end
