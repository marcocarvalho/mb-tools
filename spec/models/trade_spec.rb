require 'rails_helper'

RSpec.describe Trade, type: :model do
  context '#last_tid' do
    let!(:list) { create_list(:trade, 2) }
    it { expect(described_class.last_tid).to eq(list.last) }
  end

  describe '#validations' do
    it { is_expected.to validate_uniqueness_of(:tid) }
    it { is_expected.to validate_presence_of(:tid) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:kind) }
  end
end
