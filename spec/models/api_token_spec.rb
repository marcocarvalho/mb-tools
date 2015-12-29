require 'rails_helper'

RSpec.describe ApiToken, type: :model do
  it { is_expected.to validate_uniqueness_of :token }
  it { is_expected.to belong_to :user }

  describe '#last_valid' do
    let!(:user) { create(:user) }
    
    context 'has a valid token' do
      let!(:token1) { create(:api_token, user: user, valid_until: 1.day.since) }
      let!(:token2) { create(:api_token, user: user, valid_until: 1.minute.since) }
      let!(:token3) { create(:api_token, user: user, valid_until: 1.second.ago) }
      it { expect(ApiToken.last_valid(user)).to eq(token1) }
    end

    context 'has no valid token' do
      let!(:token1) { create(:api_token, user: user, valid_until: 1.second.ago) }
      it { expect(described_class.last_valid(user)).to eq(nil) }
    end
  end

  context '#destroy_invalid' do
    let!(:user) { create(:user) }
    let!(:token1) { create(:api_token, user: user, valid_until: 1.day.since) }
    let!(:token2) { create(:api_token, user: user, valid_until: 1.minute.since) }
    let!(:token3) { create(:api_token, user: user, valid_until: 1.second.ago) }
    it { expect { ApiToken.destroy_invalid }.to change { ApiToken.count }.by(-1) }
  end
end
