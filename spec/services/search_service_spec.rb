require 'rails_helper'

RSpec.describe SearchService, type: :services do

  let (:params) { { checkinSel: '2018-04-18', checkoutSel: '2018-04-19', name_or_state_or_city: 'S', roomSel: '1'} }
  let (:rooms) { Room.select("id").checkin_checkout(params[:checkinSel],params[:checkoutSel]) }
  let(:hotels) { Hotel.joins(:rooms).name_state_city(params[:name_or_state_or_city]).room_inactive.room_id_not(rooms).room_count(params[:roomSe]).uniq }
  describe 'by name_or_state_or_city' do
    context 'when any of this is present' do
      context 'and when room is available on the given check-in check-out date' do
        it ' returns hotel list' do
          h = hotels
          expect(h).to eq nil
        end
      end
      context 'and when room is not available on the given check-in check-out date' do
        it 'returns nil value' do
        end
      end  	    
  	end
  	context 'when any of this is not present' do
      it 'returns nil value' do
      end  		
  	end
  end

=begin  describe 'by rating' do
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
=end

end
