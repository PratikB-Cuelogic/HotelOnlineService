require 'rails_helper'

RSpec.describe SearchService do

  let (:params) { { checkinSel: '2018-06-21', checkoutSel: '2018-06-22', name_or_state_or_city: 'S', roomSel: '1'} }
  describe 'by name_or_state_or_city' do
    context 'when any of this is present' do
      context 'and when room is available on the given check-in check-out date' do
        it ' returns hotel list' do
          result = SearchService.search_by_all params
          expect(result).not_to eq nil
        end
      end
      context 'and when room is not available on the given check-in check-out date' do
        it 'returns nil value' do
          result = SearchService.search_by_all params
          expect(result.empty?).to eq true
        end
      end  	    
  	end
  end

end
