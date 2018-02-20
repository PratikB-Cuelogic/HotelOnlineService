require 'rails_helper'

RSpec.describe SearchService, type: :services do

=begin  let (:params) { { checkinSel: '2018-04-18', checkoutSel: '2018-04-19', name_or_state_or_city: 'S', roomSel: '1'} }
  let (:rooms) { Room.select("id").checkin_checkout(params[:checkinSel],params[:checkoutSel]) }
  let(:hotels) { Hotel.joins(:rooms).name_state_city(params[:name_or_state_or_city]).room_inactive.room_id_not(rooms).room_count(params[:roomSe]).uniq }
=end  
  describe 'by name_or_state_or_city' do
    context 'when any of this is present' do
      context 'and when room is available on the given check-in check-out date' do
        it ' returns hotel list' do
=begin          h = hotels
          expect(h).to eq nil
=end          
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

end
