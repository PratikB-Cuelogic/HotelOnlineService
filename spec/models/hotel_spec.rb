require 'rails_helper'

RSpec.describe Hotel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  subject{described_class.reflect_on_association(ascc_name)}

  context "Associations" do
    it "has many rooms" do
      assc = described_class.reflect_on_association(:rooms)
      expect(assc.macro).to eq :has_many
    end

    it "has many images" do
      assc = described_class.reflect_on_association(:images)
      expect(assc.macro).to eq :has_many
    end
  end
end
