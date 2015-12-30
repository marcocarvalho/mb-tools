require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password }

  context 'uniqueness' do
    subject { create(:user) }
    it { is_expected.to validate_uniqueness_of :email }
  end

  it { is_expected.to have_many :api_tokens }

  context 'save password encripted' do
    it 'encrypt' do
      u = User.create(email: 'email@email.com', password: '1234')
      expect(u.password_digest).not_to eq('1234')
    end
  end

  it '#last_valid_token' do
    expect(ApiToken).to receive(:last_valid).with(subject).and_return(:token)
    expect(subject.last_valid_token).to eq(:token)
  end

  it '#create_ephemeral_token' do
    expect(ApiToken).to receive(:create_ephemeral_token).with(subject).and_return(:token)
    expect(subject.create_token).to eq(:token)
  end
end
