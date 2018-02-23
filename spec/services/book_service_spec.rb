require 'rails_helper'

RSpec.describe BookService do	
  let(:booking_not_done) { { :room_select => {"3"=>"1"}, :checkin => '2018-02-24', :checkout => '2018-02-25', :member => 2} }
  let(:booking_done) { { :room_select => {"3"=>"1"}, :checkin => '2018-02-23', :checkout => '2018-02-24', :member => 2} }
  describe 'by user' do
    context 'when the user is logged in,' do
      context 'and if the room is not booked on given checkin checkout date' do
        it 'create booking on the given checkin checkout date and returns false' do
          b = BookService.check_room_booking_availability booking_not_done
          expect(b).to eq false
        end
      end
	  context 'and if the room is booked on given checkin checkout date' do
      it 'it returns true' do
        b = BookService.check_room_booking_availability booking_done
        expect(b).to eq true
  	  end
    end
    end
  end
end