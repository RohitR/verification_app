require 'rails_helper'

RSpec.describe Email, type: :model do

  it "has a valid factory" do
    expect(build(:email)).to be_valid
  end

  let(:email) {create(:email)}

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

  end

  describe 'associations' do
    it { should belong_to(:employer) }
  end
end
