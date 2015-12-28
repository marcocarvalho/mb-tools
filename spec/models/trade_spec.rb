require 'rails_helper'

RSpec.describe Trade, type: :model do
  it { is_expected.to validate_uniqueness_of(:tid) }
  it { is_expected.to define_enum_for(:kind).with([:buy, :sell]) }

  let!(:list) { create_list(:trade, 2) }

  it '#last_tid' do
    expect(described_class.last_tid).to eq(list.last)
  end
end
