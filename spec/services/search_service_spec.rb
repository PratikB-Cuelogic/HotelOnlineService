require 'rails_helper'

RSpec.describe SearchService do
  let(:params) { { checkinSel: '2018-06-21', checkoutSel: '2018-06-22', name_or_state_or_city: 'S', roomSel: '1'} }
  let(:params1) { { checkinSel: '2018-02-23', checkoutSel: '2018-02-24', name_or_state_or_city: 'S', roomSel: '1'} }
  let(:params2) { { checkinSel: '2018-02-23', checkoutSel: '2018-02-24', name_or_state_or_city: 'Zubin', roomSel: '1'} }
  describe 'by name_or_state_or_city' do
    context 'when any of this is present' do
      context 'and when room is available on the given check-in check-out date' do
        it ' returns array of hotel list' do
          result = SearchService.search_by_all params
          expect(result.empty?).to eq false
        end
      end
      context 'and when room is not available on the given check-in check-out date' do
        it 'returns empty array' do
          result = SearchService.search_by_all params1
          expect(result.empty?).to eq true
        end
      end  	    
  	end
    context 'when any of this is not present' do
      it ' returns empty array' do
        result = SearchService.search_by_all params2
        expect(result.empty?).to eq true
      end
    end    
  end
end
