require 'rails_helper'

RSpec.describe TradePolicy, type: :policy do
  subject { described_class }

  permissions :create?, :last_tid? do
    let(:api_token) { create(:api_token) }
    it { expect(subject).not_to permit('randon-uuid', Object) }
    it { expect(subject).to permit(api_token.token, Object) }
  end
end