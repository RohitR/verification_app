require 'rails_helper'

RSpec.describe Employer, type: :model do

  it "has a valid factory" do
    expect(build(:employer)).to be_valid
  end

  let(:employer) {create(:employer)}

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }

  end

  describe 'associations' do
    it { should have_one(:phone) }
    it { should have_one(:email) }
  end
end
