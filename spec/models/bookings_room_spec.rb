require 'rails_helper'

RSpec.describe BookingsRoom, type: :model do
  context "Associations" do
    it "belongs to room" do
      assc = described_class.reflect_on_association(:room)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs to booking" do
      assc = described_class.reflect_on_association(:booking)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
