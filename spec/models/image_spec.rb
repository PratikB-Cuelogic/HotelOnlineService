require 'rails_helper'

RSpec.describe Image, type: :model do
  context "Associations" do
    it "belongs to either hotel or room" do
      assc = described_class.reflect_on_association(:imageable)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
