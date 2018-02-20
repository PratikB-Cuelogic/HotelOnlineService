require 'rails_helper'

RSpec.describe SearchService do

  let (:params) { { checkinSel: '2018-02-21', checkoutSel: '2018-02-22', name_or_state_or_city: 'S', roomSel: '1'} }
  subject(:search) {  described_class.new params  }
  describe 'by name_or_state_or_city' do
    context 'when any of this is present' do
      context 'and when room is available on the given check-in check-out date' do
        it ' returns hotel list' do
          result = search.search_by_all
          expect(result).not_to eq nil
        end
      end
      context 'and when room is not available on the given check-in check-out date' do
        it 'returns nil value' do
          result = search.search_by_all
          expect(result.empty?).to eq true
        end
      end  	    
  	end
  end

end
