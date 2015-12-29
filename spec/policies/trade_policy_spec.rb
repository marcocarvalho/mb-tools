require 'rails_helper'

RSpec.describe TradePolicy, type: :policy do
  subject { described_class }

  permissions :create?, :last_tid? do
    it { expect(subject).not_to permit('randon-uuid', Object) }
  end
end