require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with valid attributes' do
    let(:valid_attributes) { {
      email: "fake@example.com",
      password: "test1234"
    } }

    it 'is valid' do
      user = described_class.new(valid_attributes)
      expect(user.valid?).to be(true)
    end
  end
end
