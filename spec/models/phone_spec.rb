require 'rails_helper'

RSpec.describe Phone, type: :model do

  it "has a valid factory" do
    expect(build(:phone)).to be_valid
  end

  let(:phone) {create(:phone)}

  describe 'validations' do
    it { should validate_presence_of(:phone) }
    it { should validate_uniqueness_of(:phone) }

  end

  describe 'associations' do
    it { should belong_to(:employer) }
  end
end
